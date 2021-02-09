//  Requires
const express = require ('express');

const e_empresa = require('./util/Config');

const dotenv = require('dotenv');

const path = require('path');

const sql = require('./util/conexao');

const handlebars = require('express-handlebars');

const bodyParser = require('body-parser');



// Setamento 
const app = express();

const urlencodeParser =  bodyParser.urlencoded({extended : false});

app.use(bodyParser.json());

//app.use(bodyParser.urlencoded({extended : false}));

dotenv.config({path : "./.env"});

const publicdirectory = path.join(__dirname, './public');

app.use(express.static(publicdirectory));

app.engine("handlebars", handlebars({
    defaultLayout : 'main',
    helpers: {
        formatDate: (date) => {
            return moment(date).format('DD/MM/YYYY')
        }
    }

}));

app.set('view engine' , 'handlebars');

app.use('/img', express.static('img'));

// Porta
let porta = process.env.porta || 3000;



// Rotas - Gets e Sets

app.get('/',  function(req, res) {

    res.render('index', {edados : e_empresa});

})

app.get('/consulta', function(req, res) {

      res.render('escolha');

})


app.get('/cadastrar', function (req, res){

    res.render('cadastrar')

})


// posts
app.post('/buscar', urlencodeParser , function(req, res) {

    sql.query("select * from numleis where tipo = ? ORDER BY id DESC ", 
       [
           req.body.tipo
       
        ] , 
        
        function(err, results, fields){

        res.render('consulta', {datas : results});

    })
     
})

app.post('/inserir', urlencodeParser, function(req, res){
 
    sql.query("INSERT INTO numleis (numero, tipo, ementa, data, idusuario) values (?, ?, ?, ?, ?)" ,
             [
                   req.body.numero,
                   req.body.tipo,
                   req.body.ementa,
                   req.body.data,
                   1 

             ], 
             
             function(err, results, fields){

             res.redirect('/consulta');   
  
    })


})


app.get('/deletar/:id' , function(req, res){

    sql.query("DELETE FROM numleis WHERE id = ?", 
        [
            req.params.id
        
        ], 
            
        function(err, results, fields){

        res.redirect('/consulta');  

    })

})


// Servidor
app.listen(porta, function(){

    console.log ('Servidor rodando na porta ' + porta);

})

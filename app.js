import express from 'express';
import { controller } from './controller/todo_controller.js';

var app = express();

//view
app.set('view engine', 'ejs');

//controlling routes using express for static files
app.use('/assets',express.static('assets'));

//controllers
controller(app);

app.listen(3000);
console.log("you are listerning to port 3000");
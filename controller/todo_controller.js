import { urlencoded } from "body-parser";
import pkg from "mongoose";
const { connect, Schema, model } = pkg;

//connection to db
connect(
  "url from mongodb"
);

//creating a schema
var todoSchema = new Schema({
  item: String,
});

var Todo = model("Todo", todoSchema);

var urlEncodedParser = urlencoded({ extended: false });

var controller = function (app) {
  app.get("/todo", function (req, res) {
    //get data from database and pass it to view
    Todo.find({}, (err, data) => {
      if (err) throw err;
      res.render("todo", { todos: data });
    });
  });

  app.post("/todo", urlEncodedParser, function (req, res) {
    //get data from view and add to the database
    var newTodo = Todo(req.body).save((err, data) => {
      if (err) throw err;
      res.json(data);
    });
  });

  app.delete("/todo/:item", function (req, res) {
    //delete a requested item from databse
    Todo.find({ item: req.params.item.replace(/\-/g, " ") }).remove(
      (err, data) => {
        if (err) throw err;
        res.json(data);
      }
    );
  });
};

export { controller };

package todos;

import java.util.ArrayList;

public class Todos {
    private ArrayList<Todo> todos = new ArrayList<>();

    private String text = null;
    private String method = null;
    private String completed = null;
    private String id = null;
    private void addTodo() {
        todos.add(new Todo(text, completed != null, todos.size()));
    }
    private void removeTodo(){
        int id = Integer.parseInt(this.id);
        todos.removeIf((todo) -> todo.getId() == id);
    }
    private void completeTodo(){
        int id = Integer.parseInt(this.id);
        todos.get(id).setCompleted(completed.equals("true"));
    }
    private void updateTodo(){
        int id = Integer.parseInt(this.id);
        todos.get(id).setCompleted(completed != null);
        todos.get(id).setText(text);
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method;
    }

    public String getCompleted() {
        return completed;
    }

    public void setCompleted(String completed) {
        this.completed = completed;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Todo[] getTodos() {
        Todo[] a = new Todo[todos.size()];
        a = todos.toArray(a);
        return a;
    }

    public void processRequest() {
        // null value for submit - user hit enter instead of clicking on
        // "add" or "remove"
        if(method == null) return;
        if (method.equals("add") && text != null)
            addTodo();
        else if (method.equals("remove") && id != null)
            removeTodo();
         if(method.equals("comp") && id != null && completed != null)
            completeTodo();
         if(method.equals("update") && id != null && text != null)
             updateTodo();

        // reset at the end of the request
        reset();
    }

    // reset
    private void reset() {
        method = null;
        text = null;
        completed = null;
        id = null;
    }

}


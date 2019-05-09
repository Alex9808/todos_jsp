package todos;

public class Todo{
    private String text;
    private boolean completed;
    private int id;

    public Todo(String text, boolean completed, int id) {
        this.text = text;
        this.completed = completed;
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}

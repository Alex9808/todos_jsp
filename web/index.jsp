<%@ page import="todos.Todos" %>
<%@ page import="todos.Todo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:useBean id="todo" scope="session" class="todos.Todos"/>
<jsp:setProperty name="todo" property="*"/>
<%
    todo.processRequest();
%>
<head>
    <title>$Title$</title>
    <link href="./css/style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
</head>
<body>
<header class="appbar">
    <nav class="toolbar">
        <h4 class="header-title">JSP <strong>TODO</strong> App</h4>
        <button onclick="showModal()" class="fab secondary normal" style="transform: translateY(38px);"><i
                class="material-icons">add</i>
        </button>
    </nav>
</header>
<div style="margin-top: 92px">
    <ul class="list">
        <%
            Todo[] items = todo.getTodos();
            for (Todo item : items) {%>
        <li onmouseleave="setIconInvisible(this)" onmouseenter="setIconVisible(this)"
            data-completed="<%out.print(item.isCompleted());%>" class="list-item">
            <span onclick="showEditModal({text: <%out.print("\'" + item.getText() + "\'");%>, completed: <%out.print(item.isCompleted());%>, id: <%out.print(item.getId());%>})" class="list-item-text"
                  style="text-decoration: <% if(item.isCompleted()) out.print("line-through"); else out.print("none"); %>"><%
                out.print(item.getText());%></span>
            <button onclick="setTaskCompleted(<%out.print(item.getId());%>,<%out.print(item.isCompleted());%>)"
                    class="fab primary small"
                    style="display: <% if(item.isCompleted()) out.print("inline-block"); else out.print("none"); %>">
                <i class="material-icons"> done </i>
            </button>
        </li>
        <%
            }
        %>
    </ul>
</div>
<div id="modal" class="modal">
    <div class="modal-fade">
        <div class="modal-area">
            <div class="modal-content">
                <div class="modal-header">
                    <h4>New Task</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="text">Text</label>
                            <input class="input" type="text" id="text" name="text" placeholder="Text here">
                        </div>
                        <div class="form-group">
                            <label style="display: inline-flex;" for="completed">Completed</label>
                            <input style="display: inline-flex;" type="checkbox" id="completed" name="completed">
                        </div>
                        <div class="form-group" style="display: flex">
                            <div style="flex-grow: 1"></div>
                            <button class="button"
                                    style="background-color: transparent; color: black; margin-right: 10px;"
                                    onclick="this.preventDefault(); hideModal()">cancel
                            </button>
                            <input class="button" type="submit" value="add" name="method">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="edit-modal" class="modal">
    <div class="modal-fade">
        <div class="modal-area">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 id="edit-title"></h4>
                </div>
                <div class="modal-body">
                    <form>
                        <input id="edit-id" name="id" type="hidden" hidden style="visibility: collapse">
                        <div class="form-group">
                            <label for="edit-text">Text</label>
                            <input class="input" type="text" id="edit-text" name="text" placeholder="Text here">
                        </div>
                        <div class="form-group" style="visibility: collapse; display: none">
                            <label style="display: inline-flex;" for="edit-completed">Completed</label>
                            <input style="display: inline-flex;" type="checkbox" id="edit-completed" name="completed">
                        </div>
                        <div class="form-group" style="display: flex">
                            <div style="flex-grow: 1"></div>
                            <button class="button"
                                    style="background-color: transparent; color: black"
                                    onclick="this.preventDefault(); hideEditModal()">cancel
                            </button>
                            <input class="button" type="submit" style="background-color: #f44336; margin: 0 10px" value="remove" name="method">
                            <input class="button" type="submit" value="update" name="method">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="./js/main.js"></script>
</body>
</html>

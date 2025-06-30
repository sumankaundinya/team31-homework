import { useContext, useState } from "react";
import { TodoContext } from "../contexts/TodoContext";

function TodoList() {
  const { todos, dispatch } = useContext(TodoContext);
  const [newTodo, setNewTodo] = useState("");

  const handleAdd = () => {
    if (newTodo.trim() !== "") {
      dispatch({ type: "add", payload: newTodo });
      setNewTodo("");
    }
  };

  return (
    <div style={{ marginTop: "2rem" }}>
      <h2>📝 Todo List</h2>

      <input
        type="text"
        placeholder="New todo"
        value={newTodo}
        onChange={(e) => setNewTodo(e.target.value)}
      />
      <button onClick={handleAdd}>Add</button>

      <ul>
        {todos.map((todo) => (
          <li key={todo.id}>
            <span
              style={{
                textDecoration: todo.completed ? "line-through" : "none",
                cursor: "pointer",
              }}
              onClick={() => dispatch({ type: "toggle", payload: todo.id })}
            >
              {todo.text}
            </span>
            <button
              onClick={() => dispatch({ type: "remove", payload: todo.id })}
            >
              ❌
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}

export default TodoList;

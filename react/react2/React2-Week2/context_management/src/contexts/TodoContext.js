import { createContext, useReducer } from "react";

export const TodoContext = createContext();

const initialState = [
  { id: 1, text: "Learn Context", completed: false },
  { id: 2, text: "Learn Reducer", completed: false },
];

function todoReducer(state, action) {
  switch (action.type) {
    case "add":
      return [
        ...state,
        { id: Date.now(), text: action.payload, completed: false },
      ];
    case "remove":
      return state.filter((todo) => todo.id !== action.payload);
    case "toggle":
      return state.map((todo) =>
        todo.id === action.payload
          ? { ...todo, completed: !todo.completed }
          : todo
      );
    default:
      return state;
  }
}

export function TodoProvider({ children }) {
  const [todos, dispatch] = useReducer(todoReducer, initialState);

  return (
    <TodoContext.Provider value={{ todos, dispatch }}>
      {children}
    </TodoContext.Provider>
  );
}

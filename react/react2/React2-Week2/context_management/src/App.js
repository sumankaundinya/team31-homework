import logo from "./logo.svg";
import "./App.css";
import ThemeToggler from "./components/ThemeToggler";
import LanguageSwitcher from "./components/LanguageSwitcher";
import TodoList from "./components/TodoList";
import Counter from "./components/Counter";

function App() {
  return (
    <div className="App">
      <h1>Localization + Theme + Counter + Todos</h1>
      <LanguageSwitcher />
      <ThemeToggler />
      <Counter />
      <TodoList />
    </div>
  );
}

export default App;

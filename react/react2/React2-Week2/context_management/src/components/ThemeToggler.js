import { useContext } from "react";
import { ThemeContext } from "../contexts/ThemeContext";
import { LocalizationContext } from "../contexts/LocalizationContext";

function ThemeToggler() {
  const { theme, toggleTheme } = useContext(ThemeContext);
  const { translations } = useContext(LocalizationContext);

  return (
    <div
      style={{
        backgroundColor: theme === "light" ? "#ffffff" : "#1e1e1e",
        color: theme === "light" ? "#000000" : "#ffffff",
        padding: "1rem",
        borderRadius: "10px",
      }}
    >
      <h2>2) Theme Toggler</h2>
      <h2>
        {translations.greeting}! {translations.currentTheme}:{" "}
        {theme === "light" ? translations.theme : translations.themeDark}
      </h2>
      <button onClick={toggleTheme}>{translations.toggleTheme}</button>
    </div>
  );
}

export default ThemeToggler;

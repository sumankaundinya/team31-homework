import { useContext } from "react";
import { LocalizationContext } from "../contexts/LocalizationContext";

function LanguageSwitcher() {
  const { language, switchLanguage } = useContext(LocalizationContext);

  return (
    <div style={{ marginBottom: "1rem" }}>
      <h2>1) Language Switcher</h2>
      <button onClick={switchLanguage}>
        Switch Language (Current: {language})
      </button>
    </div>
  );
}

export default LanguageSwitcher;

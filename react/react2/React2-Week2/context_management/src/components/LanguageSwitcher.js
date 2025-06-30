import { useContext } from "react";
import { LocalizationContext } from "../contexts/LocalizationContext";

function LanguageSwitcher() {
  const { language, switchLanguage } = useContext(LocalizationContext);

  return (
    <div style={{ marginBottom: "1rem" }}>
      <button onClick={switchLanguage}>
        Switch Language (Current: {language})
      </button>
    </div>
  );
}

export default LanguageSwitcher;

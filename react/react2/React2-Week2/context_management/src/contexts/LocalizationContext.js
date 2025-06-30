import { createContext, useState } from "react";

export const LocalizationContext = createContext();

const languageData = {
  en: {
    greeting: "Hello",
    toggleTheme: "Toggle Theme",
    currentTheme: "Current Theme:",
    theme: "light",
    themeDark: "Dark",
  },
  hi: {
    greeting: "नमस्ते",
    toggleTheme: "थीम बदलें",
    currentTheme: "वर्तमान थीम:",
    theme: "हल्का",
    themeDark: "अंधेरा",
  },
};

export function LocalizationProvider({ children }) {
  const [language, setLanguage] = useState("en");

  const switchLanguage = () =>
    setLanguage((prev) => (prev === "en" ? "hi" : "en"));

  const translations = languageData[language];

  return (
    <LocalizationContext.Provider
      value={{ language, switchLanguage, translations }}
    >
      {children}
    </LocalizationContext.Provider>
  );
}

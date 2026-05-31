import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Home from "./pages/Home";
import Login from "./pages/Login";
import Register from "./pages/Register";
import DashboardUser from "./pages/DashboardUser"; // Import file yang baru dibuat
import DashboardAdmin from "./pages/DashboardAdmin";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
        {/* Gunakan file DashboardUser yang sudah kita buat */}
        <Route path="/permohonan-baru" element={<DashboardUser />} />
      <Route path="/admin-ppid-man2" element={<DashboardAdmin />} />
      </Routes>
    </Router>
  );
}

export default App;
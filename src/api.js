import axios from "axios";

export const API_BASE_URL = (import.meta.env.VITE_API_URL || "").replace(/\/$/, "");

export const api = axios.create({
  baseURL: API_BASE_URL,
});

api.interceptors.request.use((config) => {
  const token = localStorage.getItem("token");
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.removeItem("token");
      localStorage.removeItem("user");
    }
    return Promise.reject(error);
  }
);

export const clearAuth = () => {
  localStorage.removeItem("token");
  localStorage.removeItem("user");
};

export const getUploadUrl = (fileNameOrUrl) => {
  if (!fileNameOrUrl) return "#";
  if (/^https?:\/\//i.test(fileNameOrUrl)) return fileNameOrUrl;

  const safePath = String(fileNameOrUrl).replace(/^\/uploads\//, "");
  return encodeURI(`${API_BASE_URL}/uploads/${safePath}`);
};

import React, { useState, useEffect } from 'react';
import { api } from "../api";
import EditNavbar from './EditNavbar';

const Navbar = () => {
  const [navbarItems, setNavbarItems] = useState([]);
  const [editItem, setEditItem] = useState(null);

  useEffect(() => {
    const fetchNavbarItems = async () => {
      try {
        const response = await api.get("/api/admin/navbar");
        setNavbarItems(response.data);
      } catch (error) {
        console.error('Gagal mengambil data navbar', error);
      }
    };

    fetchNavbarItems();
  }, []);

  const handleEditClick = (item) => {
    setEditItem(item);
  };

  return (
    <nav>
      {navbarItems.map(item => (
        <div key={item.id}>
          <a href={item.href}>{item.name}</a>
          {item.submenu && (
            <div>
              {JSON.parse(item.submenu).map(subitem => (
                <a href={subitem.href} key={subitem.name}>{subitem.name}</a>
              ))}
            </div>
          )}
          <button onClick={() => handleEditClick(item)}>Edit</button>
        </div>
      ))}

      {editItem && <EditNavbar navbarData={editItem} />}
    </nav>
  );
};

export default Navbar;
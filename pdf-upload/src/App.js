import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import FileUpload from './FileUpload';
import Chatbot from './Chatbot';
import './App.css';

function App() {
  const [uploadComplete, setUploadComplete] = useState(false);

  return (
    <Router>
      <div className="App">
        <Routes>
          <Route path="/" element={<FileUpload setUploadComplete={setUploadComplete} />} />
          <Route path="/chat" element={uploadComplete ? <Chatbot /> : <FileUpload setUploadComplete={setUploadComplete} />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;

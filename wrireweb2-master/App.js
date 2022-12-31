import logo from './logo.svg';
import './App.css';
import { useEffect } from 'react'

import { Account, Overview, Admin, Author,Editor,Settting,Story, Login } from './containers/admin/';
import { Route, Routes } from 'react-router-dom';

import path from './ultis/path';
import Create_Account from './containers/admin/account/createAcc';
import Detail_Author_ad from './containers/admin/author/detailAuthor';
import Detail_Story_ad from './containers/admin/story/detailStory';
import Detail_Editor_Ad from './containers/admin/editor/detailEditor';

function App() {
  return (
    <>
      <div className="App">
        <Routes >
          <Route path = {path.ADMIN} element={<Admin/>}>
            <Route path = {path.OVERVIEW} element={<Overview/>}/>
            <Route path = {path.AUTHOR} element={<Author/>}/>
            <Route path = {path.EDITOR} element={<Editor/>}/>
            <Route path = {path.STORY} element={<Story/>}/>
            <Route path = {path.ACCOUNT} element={<Account/>}/>
            <Route path = {path.SETTING} element={<Settting/>}/>
            <Route path = {'/account/create'} element={<Create_Account/>} />
            <Route path = {'author/detail'} element={<Detail_Author_ad/>} />
            <Route path = {'story/detail'} element={<Detail_Story_ad/>} />
            <Route path= {'editor/detail'} element={<Detail_Editor_Ad/>} />
            <Route path = {path.START} element={<Overview/>}/>
          </Route>
        </Routes>
      </div>
    </>
  );
}

export default App;

import React from 'react'
import { useNavigate } from 'react-router-dom'
import Content from './content'

String.prototype.hashCode = function (charindex0, charindex1) {
  var hash = 0,
    i, chr;
  if (this.length === 0) return hash;
  for (i = 0; i < this.length; i++) {
    chr = this.charCodeAt(i);
    hash = ((hash << 5) - hash) + chr;
    hash |= 0; // Convert to 32bit integer
  }
  if (hash < 0) {
    hash = hash - 112
  }
  let hashStr = hash.toString();
  hashStr = hashStr.split('')
  hashStr[0] = charindex0
  hashStr[1] = charindex1
  hashStr = hashStr.join('')
  if (hashStr.length > 10) {
    hashStr = hashStr.substring(0, 10)
  }
  return hashStr;
}

//get content of draft, outline, chapter 
let detail_content_ = null
let name_content_ = '<Name>'

const Write = () => {
  let type_ = localStorage.getItem('TYPE')
  const navigate = useNavigate()
  //-----------------------VIEW CONTENT--------------------------
  function View_Detail() {
    let type = localStorage.getItem('TYPE')
    if (type === 'DETAILDRAFT') {
      //get content of draft, outline, chapter 
      name_content_ = localStorage.getItem('name_content')
      detail_content_ = localStorage.getItem('draft_ouline_content')
    }
    if (type === 'DETAILCHAPTER') {
      //get content of chapter 
      name_content_ = localStorage.getItem('chapter_name')
      detail_content_ = localStorage.getItem('chapter_content')
    }
    if (type === 'STORY' || type === 'CHAPTER' || type === 'OUTLINE') {
      detail_content_ = null
    }
  }
  ///----------VIEW-----------------------
  View_Detail()

  //-----------WRITE CONTENT--------------------------------
  async function click_() {
    let type = localStorage.getItem('TYPE')
    // --------------Create STORY------------------
    if (type === 'STORY') {
      const name_darft = document.getElementById('name_darft').value
      const content = localStorage.getItem('content')
      const authorid = localStorage.getItem('authorid')
      let storyid = authorid + name_darft
      storyid = storyid.hashCode('S', 'T')
      console.log(authorid + ' ' + storyid + ' ' + name_darft + ' ' + content + type)
      //create json object 
      let jsonObject = {
        "authorid": authorid.replace(/\s/g, ''),
        "storyid": storyid,
        "storyname": name_darft,
        "content": content,
      }
      let url = "http://localhost:8080/author/createstory"
      // fetch the story
      const response = await fetch(url, {
        method: "POST",
        body: JSON.stringify(jsonObject),
        headers: {
          "Content-Type": "application/json",
        },
      });
      //return update results 
      const json = await response.json();
      //check error 
      let keys = Object.keys(json[0])
      if (keys[0] === "ERROR") {
        let data = JSON.stringify(json[0].ERROR)
        alert(keys[0] + ' : ' + data)
      }
      else {
        alert(json[0].RESULT)
      }
      //remove items
      localStorage.removeItem('content')
    }
    // --------------Create Chapter------------------
    if (type === 'CHAPTER') {
      const name_darft = document.getElementById('name_darft').value
      const content = localStorage.getItem('content')
      const authorid = localStorage.getItem('authorid')
      const storyid = localStorage.getItem('storyid')
      let chapterid = authorid + storyid + name_darft
      chapterid = chapterid.hashCode('C', 'T')
      //create json object 
      let jsonObject = {
        "authorid": authorid.replace(/\s/g, ''),
        "storyid": storyid,
        "chapterid": chapterid,
        "chaptername": name_darft,
        "content": content,
      }
      let url = "http://localhost:8080/author/createchapter"
      // fetch the story
      const response = await fetch(url, {
        method: "POST",
        body: JSON.stringify(jsonObject),
        headers: {
          "Content-Type": "application/json",
        },
      });
      //return update results 
      const json = await response.json();
      //check error 
      let keys = Object.keys(json[0])
      if (keys[0] === "ERROR") {
        let data = JSON.stringify(json[0].ERROR)
        alert(keys[0] + ' : ' + data)
      }
      else {
        alert(json[0].RESULT)
      }
      //remove items
      localStorage.removeItem('content')
    }
    // --------------Create Outline------------------
    if (type === 'OUTLINE') {
      const name_darft = document.getElementById('name_darft').value
      const content = localStorage.getItem('content')
      const authorid = localStorage.getItem('authorid')
      const storyid = localStorage.getItem('storyid')
      let jsonObject = {
        "authorid": authorid.replace(/\s/g, ''),
        "storyid": storyid,
        "outlineid": storyid.substring(2, storyid.length),
        "content": content,
      }
      let url = "http://localhost:8080/author/createoutline"
      const response = await fetch(url, {
        method: "POST",
        body: JSON.stringify(jsonObject),
        headers: {
          "Content-Type": "application/json",
        },
      });
      //return results 
      const json = await response.json();
      //check error 
      let keys = Object.keys(json[0])
      if (keys[0] === "ERROR") {
        let data = JSON.stringify(json[0].ERROR)
        alert(keys[0] + ' : ' + data)
      }
      else {
        alert(json[0].RESULT)
      }
    }
    // --------------Update Story------------------
    if (type === 'DETAILDRAFT') {
      const id = localStorage.getItem('draft_ouline_id')
      const name_update = document.getElementById('name_darft').value
      const content = localStorage.getItem('content')
      if (content === null && name_update.length === 0) {
        alert('No changes were made')
      } else {
        let jsonObject = {
          "id": id,
          "name": name_update,
          "content": content
        }
        let url = "http://localhost:8080/author/updatestory"
        const response = await fetch(url, {
          method: "PUT",
          body: JSON.stringify(jsonObject),
          headers: {
            "Content-Type": "application/json",
          },
        });
        //return update results 
        const json = await response.json();
        //check error 
        let keys = Object.keys(json[0])
        if (keys[0] === "ERROR") {
          let data = JSON.stringify(json[0].ERROR)
          alert(keys[0] + ' : ' + data)
        }
        else {
          alert(json[0].RESULT)
        }
      }
      localStorage.removeItem('content')
      navigate('/story')
    }
    // --------------Update Chapter------------------
    if (type === 'DETAILCHAPTER') {
      const id = localStorage.getItem('chapter_id')
      const name_update = document.getElementById('name_darft').value
      const content = localStorage.getItem('content')
      if (content === null && name_update.length === 0) {
        alert('No changes were made')
      } else {
        let jsonObject = {
          "id": id,
          "name": name_update,
          "content": content
        }
        let url = "http://localhost:8080/author/updatechapter"
        const response = await fetch(url, {
          method: "PUT",
          body: JSON.stringify(jsonObject),
          headers: {
            "Content-Type": "application/json",
          },
        });
        //return update results 
        const json = await response.json();
        //check error 
        let keys = Object.keys(json[0])
        if (keys[0] === "ERROR") {
          let data = JSON.stringify(json[0].ERROR)
          alert(keys[0] + ' : ' + data)
        }
        else {
          alert(json[0].RESULT)
        }
      }

      localStorage.removeItem('content')
      navigate('/story')
    }
    //reload
    window.location.reload()

  }
  return (
    <div className='flex-col w-fit h-fit'>

      <div className='mx-[200px] w-full items-center'>
        <input className='text-[36px] text-center w-full bg-transparent' placeholder={name_content_} id="name_darft">
        </input>
        <div className='text-[16px] w-full text-center'>{type_}</div>
      </div>

      <Content detail_content={detail_content_} />

      <div className='flex place-content-center w-full h-fit mt-[10px] mx-[200px]'>
        <div className='bg-[#B79F22] rounded-[100px] px-[14px] py-[2px]'>
          <button className='mx-3 text-[#ffffff]' onClick={() => click_()}>
            Done
          </button>
        </div>
      </div>

    </div>
  )
}

export default Write
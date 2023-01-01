import React from 'react'

import Content from './content'
String.prototype.hashCode = function() {
    var hash = 0,
      i, chr;
    if (this.length === 0) return hash;
  for (i = 0; i < this.length; i++) {
    chr = this.charCodeAt(i);
    hash = ((hash << 5) - hash) + chr;
    hash |= 0; // Convert to 32bit integer
  }
  if(hash < 0) {
    hash = hash  - 112}
  let hashStr = hash.toString();
  hashStr = hashStr.split('')
  hashStr[0] = 'S'
  hashStr[1] = 'T'
  hashStr = hashStr.join('')
  if(hashStr.length > 10){
    hashStr = hashStr.substring(0, 10)
  }
  return hashStr;
}

const Write = () => {
  async function click_(){
    let type = localStorage.getItem('TYPE')
    localStorage.removeItem('TYPE')
    // --------------Write STORY------------------
    if(type === 'STORY'){
      const name_darft = document.getElementById('name_darft').value
      const content = localStorage.getItem('content')
      const authorid = localStorage.getItem('authorid')
      let storyid = authorid + name_darft
      storyid = storyid.hashCode()
      console.log (authorid + ' ' + storyid + ' ' + name_darft + ' ' + content + type)
      //create json object 
      let jsonObject = {
        "authorid": authorid, 
        "storyid": storyid, 
        "storyname": name_darft,
        "content":content, 
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
      console.log(json);
      //check error 
      let keys = Object.keys(json[0])
      if (keys[0] === "ERROR"){
          let data = JSON.stringify(json[0].ERROR)
          alert(keys[0] + ' : ' + data)
      }
      else {
          alert(json[0].RESULT)
      }
    //remove items
      localStorage.removeItem('content')
    }
    // --------------Write Chapter------------------
    if(type === 'CHAPTER'){
          const name_darft = document.getElementById('name_darft').value
          const content = localStorage.getItem('content')
          const authorid = localStorage.getItem('authorid')
          const storyid = localStorage.getItem('storyid')
          alert((authorid + ' ' + storyid + ' ' + name_darft + ' ' + content + ' ' + type))
    }
    // --------------Write Outline------------------
    if(type === 'OUTLINE'){
      const name_darft = document.getElementById('name_darft').value
      const content = localStorage.getItem('content')
      const authorid = localStorage.getItem('authorid')
      const storyid = localStorage.getItem('storyid')
      alert((authorid + ' ' + storyid + ' ' + name_darft + ' ' + content + ' ' + type))
}
    //reload
    window.location.reload()
    
}
  return (
  <div className='flex-col w-fit h-fit'>
    
    <div className='mx-[200px] w-full items-center'>
      <input className='text-[36px] text-center w-full bg-transparent' placeholder='<Name>' id = "name_darft">
      </input>
      <div className='text-[16px] w-full text-center'>Draft</div>
    </div>
    
    <Content/>

    <div className='flex place-content-center w-full h-fit mt-[10px] mx-[200px]'>
      <div className='bg-[#B79F22] rounded-[100px] px-[14px] py-[2px]'>
        <button className='mx-3 text-[#ffffff]'  onClick={() => click_()}>
                Done
        </button>
      </div>   
    </div>

  </div>
  )
}

export default Write
import React from 'react'

import Content from './content'

import Dialog from "@material-ui/core/Dialog";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import Button from "@material-ui/core/Button";


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



const Read = () => {

  var chapterid =  localStorage.getItem('chapterid')
  var editorid = localStorage.getItem('editorid')
  var comment = chapterid + editorid
  var cmtid = comment.hashCode('C', 'M')
  var content =  localStorage.getItem('chapter_content')
  var cmt = localStorage.getItem('editor_comment') 
  const [open, setOpen] = React.useState(false);

  async function approveBtn() {
      // get comment
      let url = "http://localhost:8080/editor/approvebtn/"
      url = url + chapterid 
      const response = await fetch(url);
      const data = await response.json();
      
      if(Object.keys(data[0]) === 'ERROR'){ 
        console.log("ERROR: " + data[0].ERROR)
      }
      else{ 
        alert("UPDATE SUCCESSFULLY")
      }
  };
  
  async function addComment() {
    // --------------Create CMT------------------
      let content_cmt = document.getElementById('content').value
      //create json object 
      let jsonObject = {
        "cmtid": cmtid,
        "chapterid": chapterid.replace(/\s/g, ''),
        "editorid": editorid.replace(/\s/g, ''),
        "content": content_cmt,
      }
      let url = "http://localhost:8080/editor/addcomment"
      
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
      if (keys[0] === "ERROR") {
        let data = JSON.stringify(json[0].ERROR)
        alert(keys[0] + ' : ' + data)
      }
      else {
        alert(json[0].RESULT)
      }
      //remove items
      // localStorage.removeItem('content')
      
  };
  
  const handleClickToOpen = () => {
    setOpen(true);
  };
  
  const handleToClose = () => {
    setOpen(false);
  };

  return (
    
  <div className='flex-col w-fit h-fit '>
    
    <div className='flex items-center'>

      <div className='mx-[150px] w-full'>
        <div className='text-[36px] text-center w-full bg-transparent'>
          Chapter 1
        </div>
        <div className='text-[16px] w-full text-center'>Chapter</div>
      </div>
      
      <div className='bg-[#13A846] rounded-[100px] px-[14px] mx-[10px] w-[100px] h-[60px] '>
        <button className='text-[#ffffff] text-[15px]'   onClick={handleClickToOpen}>
                Add Comment
        </button>
      </div> 

    </div>

    <Dialog open={open} onClose={handleToClose}>
        <DialogTitle>{"Write your comment"}</DialogTitle>
        <DialogContent>
          <textarea className='border-[1px] rounded p-[3px] w-[300px]' id='content' >
          </textarea>
        </DialogContent>
        <DialogActions>
          <Button onClick={handleToClose} 
                  color="primary" autoFocus>
            Close
          </Button>
        </DialogActions>
        <DialogActions>
          <Button  onClick={() => addComment()} 
                  color="primary" autoFocus>
            Add
          </Button>
        </DialogActions>
      </Dialog>
    <div className='flex w-full'>
      <Content detail_content={content}/>
      <div className='bg-[#fff] w-[160px] h-fit rounded-lg ml-[10px] shadow-sm border-[2px]'>{cmt}</div>
    </div>

    <div className='flex w-full h-fit mt-[10px] ml-[200px] pl-[150px]'>
      <div className='bg-[#6731DC] rounded-[100px] px-[14px] py-[2px] mx-[10px]'>
        <button className='mx-3 text-[#ffffff]'  onClick={()=> approveBtn()}>
                Approve  
        </button>
        
      </div>   

    </div>
  </div>
  )
}
export default Read


import React from 'react'

import Content from './content'

import Dialog from "@material-ui/core/Dialog";
import DialogContentText from "@material-ui/core/DialogContentText";
import DialogTitle from "@material-ui/core/DialogTitle";
import DialogActions from "@material-ui/core/DialogActions";
import DialogContent from "@material-ui/core/DialogContent";
import Button from "@material-ui/core/Button";

const Read = () => {
  var content =  localStorage.getItem('reading_content')
  var name =  localStorage.getItem('reading_name')
  var type = localStorage.getItem('reading_type')

  return (
  <div className='flex-col w-fit h-fit '>
    
    <div className='flex items-center'>

      <div className='mx-[150px] w-full'>
        <div className='text-[36px] text-center w-full bg-transparent'>
          {type}: {name}
        </div>
      </div>
    </div>
    <div className='flex w-full'>
      <Content detail_content={content}/>
      {/* <div className='bg-[#fff] w-[160px] h-fit rounded-lg ml-[10px] shadow-sm border-[2px]'>{cmt}</div> */}
    </div>
  </div>
  )
}
export default Read


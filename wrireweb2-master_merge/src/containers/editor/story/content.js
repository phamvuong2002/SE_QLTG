import React from 'react'

const Content = ({detail_content}) => {
  const [message, setMessage] = React.useState(detail_content);
  
  const handleMessageChange = event => {
    setMessage(event.target.value);
    localStorage.setItem('content', event.target.value);
    console.log(event.target.value);
  };
  return (
    <textarea  className='w-[600px] h-[500px] bg-white shadow-md rounded-md ml-[200px]'
    id="message"
    name="message"
    value={message}
    onChange={handleMessageChange}
    ></textarea >
  )
}

export default Content
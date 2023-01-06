import React from 'react'

const Content = ({detail_content}) => {
  const [message, setMessage] = React.useState(detail_content);
  const handleMessageChange = event => {
    // 👇️ access textarea value
    setMessage(event.target.value);
    localStorage.setItem('content', event.target.value);
    console.log(event.target.value);
  };
  return (
    <textarea  className='w-full h-[500px] bg-white shadow-md rounded-md mx-[200px]'
    id="message"
    name="message"
    value={message}
    onChange={handleMessageChange}
    ></textarea >
  )
}

export default Content
import React from 'react'
import { useNavigate } from 'react-router-dom'
import { useRef } from 'react';

const Login = () => {
  const navigate = useNavigate();
    const username = useRef(null);
    const password = useRef(null);


  const check = () =>
  { 
    let login = 'author'
        switch (login) {
            case 'admin':
              localStorage.setItem('login_role', 'admin');
              window.location.reload();
                break;
            case 'editor':
              localStorage.setItem('login_role', 'editor');
              window.location.reload();
                break;
            case 'author':
              localStorage.setItem('login_role', 'author');
              window.location.reload();
                break;
            default:
                break;
        }
  };
  return (
    <div className='w-full min-h-screen flex h-full bg-[#ffffff] items-center'>
            <div className='flex-col items-center mx-[600px] text-center'>
                <input type="text" placeholder="username" id='username' className='my-[5px]' ref={username}/>
                <input type="password" placeholder="password" id='password' className='my-[5px]' ref={password}/>

                <div onClick={check} className='bg-gray-500'>Login</div>
            </div>
            
    </div>
  )
}

export default Login
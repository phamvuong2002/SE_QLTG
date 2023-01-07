import React from 'react'
import { useNavigate } from 'react-router-dom'
import { useRef } from 'react';
// import { circle_logo } from './assets';

// import circle_logo from './assets'

const Login = () => {
  const navigate = useNavigate();
  const username = useRef(null);
  const password = useRef(null);


  async function check(username, password) {
    //-------------------fetch--------------------------------
    let url = "http://localhost:8080/account/login"
    let jsonObject = {
      "username": username,
      "password": password,
    }
    const response = await fetch(url, {
      method: "POST",
      body: JSON.stringify(jsonObject),
      headers: {
        "Content-Type": "application/json",
      },
    });
    const login_data = await response.json();

    if (Object.keys(login_data[0]) == 'ERROR') {
      alert("ERROR: " + login_data[0].ERROR)
      window.location.reload()
    }
    else {
      localStorage.setItem('id_login', login_data[0].id_login)
      localStorage.setItem('name_login', login_data[0].name_login)
    }
    //----------------------------check role--------------------
    let role = null
    if(login_data[0].id_login.substring(0,2) === 'AD'){
      role = 'admin'
    }
    if(login_data[0].id_login.substring(0,2) === 'AU'){
      role = 'author'
    }
    if(login_data[0].id_login.substring(0,2) === 'ED'){
      role = 'editor'
    }
    switch (role) {
      case 'admin':
        localStorage.setItem('role', 'admin');
        localStorage.setItem('login', true);
        break;
      case 'editor':
        localStorage.setItem('role', 'editor');
        localStorage.setItem('login', true);
        break;
      case 'author':
        localStorage.setItem('role', 'author');
        localStorage.setItem('login', true);
        break;
      default:
        break;
    }
    window.location.reload()
  };

  return (
    <div className='w-full min-h-screen flex h-full bg-[#363740] items-center'>

      <div className='flex-col items-center mx-[600px] text-center bg-[#FCFDFE] w-[380px] h-[430px] rounded-lg py-[30px]'>

        <div className='flex justify-center my-[5px] mt-[30px]'>
          <img src={require('./assets/logo.png')} alt='logo' className='rounded-full w-[40px] h-[40px] border-[3px] border-[#3751FF]' />
        </div>
        <div className='text-[#A4A6B3] text-[19px] text-center'> WriReWeb</div>

        <input type="text" placeholder="Username" id='username' className='mb-[8px] mt-[20px] border-[1px] rounded p-[3px] w-[215px]' ref={username} />

        <input type="password" placeholder="Password" id='password' className='my-[10px] border-[1px] rounded p-[3px] w-[215px]' ref={password} />

        <div className='flex justify-center my-[5px] mt-[30px]'>
          <button onClick={() => check(username.current.value,password.current.value)} className='bg-[#3751FF] w-[255px] h-[30px] rounded-lg p-[4px] text-center text-[#fff]'>Login</button>
        </div>

      </div>

    </div>
  )
}

export default Login
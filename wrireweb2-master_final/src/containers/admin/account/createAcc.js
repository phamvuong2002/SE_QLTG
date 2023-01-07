import React from 'react'
import { logo } from '../../../assets'

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

const Create_Account = () => {
    //get data from form submission
    function getData(form) {
        var formData = new FormData(form);
        const values = Object.fromEntries(formData)
        return values
    }
    //fetch url
    async function createAccount(typeAccount,url_create) {
        const form = document.getElementById("createform")
        form.addEventListener("submit", async (e) => {
            e.preventDefault();
            const jsonObject = getData(e.target);
            let generateId = jsonObject.username + jsonObject.fullname
            let adminid = JSON.parse(localStorage.getItem('adminid') )
            let jsonCreate
            if(typeAccount === 'AUTHOR'){
                jsonCreate = {
                    "authorid": generateId.hashCode('A','U') ,
                    "adminid" :adminid.replace(/\s/g, '') ,
                    "username": jsonObject.username ,
                    "password": jsonObject.password,
                    "authorname": jsonObject.fullname,
                    "email":jsonObject.email ,
                    "phonenumber": jsonObject.phonenumber  
                }
            }
            if(typeAccount === 'EDITOR'){
                jsonCreate = {
                    "editorid": generateId.hashCode('E','D') ,
                    "adminid" :adminid.replace(/\s/g, '') ,
                    "username": jsonObject.username ,
                    "password": jsonObject.password,
                    "editorname": jsonObject.fullname,
                    "email":jsonObject.email ,
                    "phonenumber": jsonObject.phonenumber  
                }
            }
            const response = await fetch(url_create, {
                method: "POST",
                body: JSON.stringify(jsonCreate),
                headers: {
                    "Content-Type": "application/json",
                },
            });
            //return results 
            const json = await response.json();
            //check error 
            let keys = Object.keys(json[0])
            if (keys[0] === "ERROR"){
                let data = JSON.stringify(json[0].ERROR)
                alert(keys[0] + ' : ' + data)
            }
            else {
                alert(JSON.stringify(json[0].RESULT))
            }
        });
        window.location.reload();
    }
    function createAuthor(){
        let url = 'http://localhost:8080/admin/addauthor'
        createAccount('AUTHOR',url)

    }
    function createEditor(){
        let url = 'http://localhost:8080/admin/addeditor'
        createAccount('EDITOR',url)
    }
    
    return (
        <div className='flex-col w-fit h-fit bg-[#F7F8FC] ml-[355px]'>
            <div className="items-baseline w-[443px] h-[600px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#DFE0EB]">
                <img src={logo} alt='logo' className='px-24 py-10' />
                <div className='text-xl text-center font-bold pt-2'>
                    Create Account
                </div>
                <form className='pt-7' id = 'createform'>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">USERNAME</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='username' placeholder='Enter username' className="pl-2 bg-[#F7F8FC] text-[15px] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">PASSWORD</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='password' placeholder='Enter password' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">FULL NAME</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='fullname' placeholder='Enter Admin Name' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" require />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">PHONE NUMBER</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='phonenumber' placeholder='Enter Phone Number' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <label className="block">
                        <span className="block text-[13px] font-bold text-gray-500 pl-4">EMAIL</span>
                        <div className='block pl-5 shadow-2xl pt-1'>
                            <input name='email' placeholder='Enter Email' className="pl-2 text-[15px] bg-[#F7F8FC] block w-[400px] rounded-md border border-[#DFE0EB]" required />
                        </div>
                    </label>
                    <div className='flex place-content-center w-full mt-[20px]'>
                        <div className='bg-[#DB8E1A] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                            <button className='mx-3 text-[#ffffff] pb-2' onClick={() => createAuthor()}>
                                Create For Author
                            </button>
                        </div>
                    </div>
                    <div className='flex place-content-center w-full mt-[5px]'>
                        <div className='bg-[#3751FF] rounded-md w-[400px] justify-self-auto text-center pt-2'>
                            <button className='mx-3 text-[#ffffff] pb-2' onClick={() => createEditor()}>
                                Create For Editor
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    )
}

export default Create_Account
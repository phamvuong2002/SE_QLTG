import React, {useEffect} from 'react';
import { useNavigate } from 'react-router-dom';

const GetList = (id) => {
    let url = `http://localhost:8080/admin//editorAuthorList/${id}`;
    var authordatalist = [];
    fetch(url)
    .then((response) => response.json())
    .then(actualData => {
        // console.log(actualData.length);
        if(Object.keys(actualData[0]) == 'ERROR'){
            console.log("ERROR: ", actualData[0].ERROR);
        }
        else{
            for(let i = 0; i < actualData.length; i++){
                var newAuthorList = {};
                newAuthorList.avt = actualData[i].AVATAR;
                newAuthorList.authorid = actualData[i].AUTHORID;
                newAuthorList.name = actualData[i].AUTHORNAME;
                newAuthorList.penname = actualData[i].PENNAME;
                newAuthorList.story = actualData[i].SLT;
                newAuthorList.chapter =  actualData[i].SLC;
                authordatalist.push(newAuthorList);
            }
            console.log('authordatalist1:', authordatalist);
            localStorage.setItem('authordatalist', JSON.stringify(authordatalist));
        }
    });
};

const OverviewEditor = ({editorid, avt, name, penname, author, story}) => {
  const navigate = useNavigate();
  // console.log("ad_editor1:", JSON.parse(localStorage.getItem('ad_editor') || '[]').editorid);
  
  const HandleClick = () => {
    // alert('aaaaaaaaaaaaa');
    // console.log(storyid);
    // localStorage.removeItem('ad_editor');
    // localStorage.removeItem('authordatalist');
    var ad_editor = {"editorid": editorid, "name": name, "avt": avt, "author": author, "story": story};
    localStorage.setItem('ad_editor', JSON.stringify(ad_editor));
    // console.log(editor.author);
    // console.log("ad_editor2:", JSON.parse(localStorage.getItem('ad_editor')).editorid);
    GetList(ad_editor.editorid);
    // console.log('ae1:', JSON.parse(localStorage.getItem('ad_editor') || '[]'));
    
    // window.location.reload();
    navigate('/editor/detail', { replace: true });
    window.location.reload();
    // window.location.href='/story/detail';
  };

  return (
    <div className='flex items-center w-full bg-white px-20 py-[20px] border-t-2 border-[#DFE0EB] my-2' onClick={HandleClick}>
        {/* avt */}
        <div className=''>
            <img src={'/' + avt} alt='avt' className='rounded-full w-[44px] h-[44px] '/>
        </div>

        <div className='font-semibold mr-[30px] ml-5'>
            {name}
        </div>

        <div className='font-semibold mr-[100px] ml-[250px]'>
            {penname}
        </div>

        <div className='flex-col mr-[20px] ml-[150px] items-center'>
            <div className='font-semibold text-[14px]'>
                {author} author
            </div>
            <div className='text-[12px]'>
                {story} story
            </div>
        </div>
    </div>
  )
}

export default OverviewEditor
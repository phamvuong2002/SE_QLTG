import React from 'react';
import { useNavigate } from 'react-router-dom';

const OverviewEditor = ({editorid, avt, name, penname, author, story}) => {
  const navigate = useNavigate();
//   localStorage.removeItem('ad_editor');
  console.log("ad_editor:", JSON.parse(localStorage.getItem('ad_editor') || '[]').author);
  
  const HandleClick = () => {
    // console.log(storyid);
    var ad_editor = {"editorid": editorid, "name": name, "avt": avt, "author": author, "story": story};
    localStorage.setItem('ad_editor', JSON.stringify(ad_editor));
    // console.log(editor.author);
    console.log("ad_editor:", JSON.parse(localStorage.getItem('ad_editor')).author);
    // console.log(process.env.PUBLIC_URL + avt);
    navigate('/editor/detail');
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
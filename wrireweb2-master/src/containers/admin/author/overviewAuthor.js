import React from 'react';
import { useNavigate } from 'react-router-dom';

async function GetAuthorStoryList(id){
    console.log("id:", id);
    // window.location.reload();
    let authorstorylist = [];
    let url = `http://localhost:8080/admin/storyDataList/${id}`;
    const response = await fetch(url);
    const data = await response.json();
    
    if(Object.keys(data[0]) == 'ERROR'){
        alert("ERROR: " + data[0].ERROR);
    }
    else{ 
        for(let i = 0; i<data.length; i++){
            let url_cal = "http://localhost:8080/admin/calPaidUnpaidStory/";
            url_cal = url_cal + data[i].storyid;
            const response_cal = await fetch(url_cal);
            const data_cal = await response_cal.json();
            data[i]["unpaid"] = data_cal[0].unpaid.toFixed(2);
            data[i]["paid"] = data_cal[0].paid.toFixed(2);
        }
        authorstorylist = data;
        localStorage.setItem('authorstorylist', JSON.stringify(authorstorylist));
        console.log('authorstorylist1:', JSON.parse(localStorage.getItem('authorstorylist')));
    }
}

const OverviewAuthor = ({authorid, avt, name, penname, chapter, story/*, paid_stt*/}) => {
  const navigate = useNavigate();
  
  const HandleClick = () => {
    // console.log(storyid);
    var ad_author = {"authorid": authorid, "name": name, "avt": avt};
    console.log("ad_author0:", ad_author.authorid);
    localStorage.setItem('ad_author', JSON.stringify(ad_author));
    GetAuthorStoryList(authorid);
    navigate('/author/detail', { replace: true });
    // window.location.reload();
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

        <div className='font-semibold mr-[150px] ml-5'>
            {penname}
        </div>

        <div className='flex-col mr-[90px] items-center'>
            <div className='font-semibold text-[14px]'>
                {story} story
            </div>
            <div className='text-[12px]'>
                {chapter} chapter
            </div>
        </div>
        
        {/* <div className='bg-[#F12B2C] rounded-3xl px-5 ml-40 items-center'>
            <button className='mx-3 text-[#ffffff]' >
                {paid_stt}
            </button>
        </div> */}
    </div>
  )
}

export default OverviewAuthor
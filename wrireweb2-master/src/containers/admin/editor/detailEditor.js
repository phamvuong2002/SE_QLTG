import React from 'react';
import { useNavigate } from 'react-router-dom';

let authorstorylist = [];

const AllEditorWork = ({authorid, name, penname, story, chapter, avt}) => {
    // authordatalist = [];
    const navigate = useNavigate();
    const HandleClick = async () => {
        var ad_author = {"authorid": authorid, "name": name, "avt": avt};
        localStorage.setItem('ad_author', JSON.stringify(ad_author));
        let url = `http://localhost:8080/admin/storyDataList/${authorid}`;
        const response = await fetch(url);
        const data = await response.json();
        
        if(Object.keys(data[0]) == 'ERROR'){
            alert("ERROR: " + data[0].ERROR);
            var newauthorstorylist = {
                unpaid: 0,
                paid: 0,
                storyid: "None",
                avt: "empty.jpg",
                name: "None",
                process: "None",
                numofchaps: 0,
                approve: 0
            };
            authorstorylist.push(newauthorstorylist);
            localStorage.setItem('authorstorylist', JSON.stringify(authorstorylist));
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
        navigate('/author/detail');
        window.location.reload();
    };
    return(
        <div className='flex' onClick={HandleClick}>
            <div className='text-[#9FA2B4] ml-[20px] mt-[10px] font-bold text-sm w-[50px] h-[50px]'>
                <img src={'/' + avt} alt='Hinh'></img>
            </div>
            <div className='text-[#252733] ml-[8px] mt-[13px] font-bold text-sm'>
                <p className=''>{name}</p>
                {/* <div className='text-[#C5C7CD] text-[10px]'>
                    <p className=''>Update 1 day ago</p>
                </div> */}
            </div>
            <div className='mt-[10px] ml-[202px] font-bold text-sm text-[#252733]'>
                <p>{penname}</p>
                {/* <div className='text-[#C5C7CD] text-[10px]'>
                    <p className=''>Start on 24.05.2019</p>
                </div> */}
            </div>
            <div className='mt-[8px] ml-[130px] font-bold text-sm text-[#C62527331C1C]'>
                <p>{story} story</p>
                <div className='text-[#C5C7CD] text-[10px]'>
                    <p className=''>{chapter} chapters</p>
                </div>
            </div>
            {/* <div className='mt-[13px] ml-[130px] font-bold text-sm text-[#C61C1C]'>
                <div className='w-[102px] h-[24px] bg-[#29CC97] text-center pt-0.5 text-[#ffffff] rounded-full'>
                    <p>PAID</p>
                </div>
            </div> */}
        </div>
    )
}

const OverviewEditorAuthorList = ({authordatalist}) => {
    return (
      <div className='py-1'>
        {authordatalist.map((data) => (
            <AllEditorWork
            authorid={data.authorid}
            avt={data.avt}
            name={data.name}
            penname={data.penname}
            story={data.story}
            chapter={data.chapter} 
            />
        ))}
      </div>
    )
  }

const Detail_Editor_Ad = () => {
    const ad_editor = JSON.parse(localStorage.getItem('ad_editor') || '[]');
//   localStorage.removeItem('ad_author');
//   console.log('ae0:', JSON.parse(localStorage.getItem('ad_editor') || '[]'));
//   var temp = '121123';
//   localStorage.removeItem('ad_editor');       
//   console.log(actualData);

  let authordatalist = JSON.parse(localStorage.getItem('authordatalist'));
  console.log('authordatalist2:', authordatalist);
  return (
      <div className='flex-col shadow-2xl w-[1020px] h-[537px] border rounded-lg bg-[#F7F8FC] ml-[70px]'>   
          <div className='flex pl-10 pt-5'>
              <img src={'/' + ad_editor.avt} alt='avt' className='rounded-full w-[150px] h-[150px] '/>
              <div className='pl-10 pt-12 pr-[120px]'>
                  <p className='text-[40px]'>
                    {ad_editor.name}
                    </p>
              </div>
              <div className='flex' >
                  <div className='w-[227px] h-[134px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#BFB17C]'>
                      <p className='text-center pt-5 text-[#D0AB4C] text-[20px]'>
                          Author
                      </p>
                      <p className='text-center pt-3 text-4xl text-bold text-[#D0AB4C]'>
                          {ad_editor.author}
                      </p>
                  </div>
                  <div className='w-[227px] h-[134px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#3751FF] ml-[40px]' >
                      <p className='text-center pt-5 text-[#3751FF] text-[20px]'>
                          Story
                      </p>
                      <p className='text-center pt-3 text-4xl text-bold text-[#3751FF]'>
                          {ad_editor.story}
                      </p>
                  </div>
              </div>
          </div>
          {/* <div className='bg-[#F12B2C] shadow-2xl rounded-full w-[70px] h-[20px] mb-3 text-sm text-center ml-[870px]'>
              <a href=''>
                  <button className='text-[#ffffff]' >
                      Delete
                  </button>
              </a>
          </div> */}
          <div className='shadow-2xl border-t-[#DFE0EB]-500 w-[1020px] h-[347px] border rounded-lg bg-[#F7F8FC]'>
              <div className='text-[#252733] text-xl font-bold ml-[20px] mt-[20px]'>
                  <h1>All Author Management</h1>
              </div>
              <div>
                  <div className='flex pb-3'>
                      <div className='text-[#9FA2B4] ml-[20px] mt-[20px] font-bold text-sm'>
                          <p>Author Detail</p>
                      </div>
                      <div className='text-[#9FA2B4] ml-[280px] mt-[20px] font-bold text-sm'>
                          <p>Pen Name</p>
                      </div>
                      <div className='text-[#9FA2B4] ml-[153px] mt-[20px] font-bold text-sm'>
                          <p>Progress</p>
                      </div>
                      {/* <div className='text-[#9FA2B4] ml-[150px] mt-[20px] font-bold text-sm'>
                          <p>Paid Status</p>
                      </div> */}
                  </div>
                  <hr></hr>
                  <div className=' items-center'>
                    <OverviewEditorAuthorList authordatalist={authordatalist}/>
                  </div>
              </div>
          </div>
      </div>
  )
}

export default Detail_Editor_Ad
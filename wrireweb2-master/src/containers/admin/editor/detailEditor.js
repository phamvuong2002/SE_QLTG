import { Outlet } from 'react-router-dom'
import React from 'react'
import { useNavigate } from 'react-router-dom'
import { eren } from '../../../assets'
import { meo1 } from '../../../assets'

const Detail_Editor_Ad = () => {
  const navigate = useNavigate()
  return (
      <div className='flex-col shadow-2xl w-[1020px] h-[537px] border rounded-lg bg-[#F7F8FC] ml-[70px]'>   
          <div className='flex pl-10 pt-5'>
              <img src={eren} alt='avt' className='rounded-full w-[150px] h-[150px] '/>
              <div className='pl-10 pt-12 pr-[120px]'>
                  <p className='text-[40px]'>Lý Đa</p>
              </div>
              <div className='flex' >
                  <div className='w-[227px] h-[134px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#BFB17C]'>
                      <p className='text-center pt-5 text-[#D0AB4C] text-[20px]'>
                          Author
                      </p>
                      <p className='text-center pt-3 text-4xl text-bold text-[#D0AB4C]'>
                          1
                      </p>
                  </div>
                  <div className='w-[227px] h-[134px] bg-[#ffffff] shadow-2xl rounded-lg border border-[#3751FF] ml-[40px]' >
                      <p className='text-center pt-5 text-[#3751FF] text-[20px]'>
                          Story
                      </p>
                      <p className='text-center pt-3 text-4xl text-bold text-[#3751FF]'>
                          3
                      </p>
                  </div>
              </div>
          </div>
          <div className='bg-[#F12B2C] shadow-2xl rounded-full w-[70px] h-[20px] mb-3 text-sm text-center ml-[870px]'>
              <a href=''>
                  <button className='text-[#ffffff]' >
                      Delete
                  </button>
              </a>
          </div>
          <div className='shadow-2xl border-t-[#DFE0EB]-500 w-[1020px] h-[347px] border rounded-lg bg-[#F7F8FC]'>
              <div className='text-[#252733] text-xl font-bold ml-[20px] mt-[20px]'>
                  <h1>All Author Management</h1>
              </div>
              <div onClick={()=>navigate('/story/detail')}>
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
                      <div className='text-[#9FA2B4] ml-[150px] mt-[20px] font-bold text-sm'>
                          <p>Paid Status</p>
                      </div>
                  </div>
                  <hr></hr>
                  <div className='flex'>
                      <div className='text-[#9FA2B4] ml-[20px] mt-[10px] font-bold text-sm w-[50px] h-[50px]'>
                          <img src={meo1} alt='Hinh'></img>
                      </div>
                      <div className='text-[#252733] ml-[8px] mt-[13px] font-bold text-sm'>
                          <p className=''>Chú bé chăn cừu</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>Update 1 day ago</p>
                          </div>
                      </div>
                      <div className='mt-[10px] ml-[202px] font-bold text-sm text-[#252733]'>
                          <p>Tom Cruise</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>Start on 24.05.2019</p>
                          </div>
                      </div>
                      <div className='mt-[8px] ml-[130px] font-bold text-sm text-[#C62527331C1C]'>
                          <p>3 story</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>200 chapters</p>
                          </div>
                      </div>
                      <div className='mt-[13px] ml-[130px] font-bold text-sm text-[#C61C1C]'>
                          <div className='w-[102px] h-[24px] bg-[#29CC97] text-center pt-0.5 text-[#ffffff] rounded-full'>
                              <p>PAID</p>
                          </div>
                      </div>
                  </div>
                  <div className='flex'>
                      <div className='text-[#9FA2B4] ml-[20px] mt-[10px] font-bold text-sm w-[50px] h-[50px]'>
                          <img src={meo1} alt='Hinh'></img>
                      </div>
                      <div className='text-[#252733] ml-[8px] mt-[13px] font-bold text-sm'>
                          <p className=''>Chú bé chăn cừu</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>Update 1 day ago</p>
                          </div>
                      </div>
                      <div className='mt-[10px] ml-[202px] font-bold text-sm text-[#252733]'>
                          <p>Tom Cruise</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>Start on 24.05.2019</p>
                          </div>
                      </div>
                      <div className='mt-[8px] ml-[130px] font-bold text-sm text-[#C62527331C1C]'>
                          <p>3 story</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>200 chapters</p>
                          </div>
                      </div>
                      <div className='mt-[13px] ml-[130px] font-bold text-sm text-[#C61C1C]'>
                          <div className='w-[102px] h-[24px] bg-[#29CC97] text-center pt-0.5 text-[#ffffff] rounded-full'>
                              <p>PAID</p>
                          </div>
                      </div>
                  </div>
                  <div className='flex'>
                      <div className='text-[#9FA2B4] ml-[20px] mt-[10px] font-bold text-sm w-[50px] h-[50px]'>
                          <img src={meo1} alt='Hinh'></img>
                      </div>
                      <div className='text-[#252733] ml-[8px] mt-[13px] font-bold text-sm'>
                          <p className=''>Chú bé chăn cừu</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>Update 1 day ago</p>
                          </div>
                      </div>
                      <div className='mt-[10px] ml-[202px] font-bold text-sm text-[#252733]'>
                          <p>Tom Cruise</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>Start on 24.05.2019</p>
                          </div>
                      </div>
                      <div className='mt-[8px] ml-[130px] font-bold text-sm text-[#C62527331C1C]'>
                          <p>3 story</p>
                          <div className='text-[#C5C7CD] text-[10px]'>
                              <p className=''>200 chapters</p>
                          </div>
                      </div>
                      <div className='mt-[13px] ml-[130px] font-bold text-sm text-[#C61C1C]'>
                          <div className='w-[102px] h-[24px] bg-[#29CC97] text-center pt-0.5 text-[#ffffff] rounded-full'>
                              <p>PAID</p>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  )
}

export default Detail_Editor_Ad
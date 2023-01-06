import React from 'react'
import OverviewStory from './overviewStory'

const OverviewStoryList = ({storyData}) => {
  return (
    <div className='py-1 overflow-y-scroll h-[500px]'>
        {storyData.map((data) => (
        <OverviewStory
        
        storyid = {data.storyid}
        avt={data.avt}
        name={data.name}
        process={data.process}
        approve={data.approve}
        unpaid={data.unpaid}
        paid={data.paid}
        authorname={data.authorname}    
        authorid={data.authorid}    
        
        />
        ))}
    </div>
  )
}

export default OverviewStoryList
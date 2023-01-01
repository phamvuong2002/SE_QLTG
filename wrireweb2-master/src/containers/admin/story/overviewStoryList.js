import React from 'react'
import OverviewStory from './overviewStory'

const OverviewStoryList = ({storyData}) => {
  return (
    <div className='py-1 overflow-y-scroll h-[500px]'>
        {storyData.map((data) => (
        <OverviewStory
        key={data.id}
        storyid={data.storyid}
        avt={data.avt}
        name={data.name}
        Process={data.process}
        approve={data.approve}
        // unpaid={data.unpaid}
        // paid={data.paid}    
        />
        ))}
    </div>
  )
}

export default OverviewStoryList
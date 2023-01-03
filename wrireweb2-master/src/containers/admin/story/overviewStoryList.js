import React from 'react'
import OverviewStory from './overviewStory'

const OverviewStoryList = ({storyData}) => {
  return (
    <div className='py-1 overflow-y-scroll h-[500px]'>
        {storyData.map((data) => (
        <OverviewStory
        storyid={data.storyid}
        avt={data.avt}
        name={data.name}
        process={data.process}
        numofchaps={data.numofchaps}
        authorname={data.authorname}        
        // unpaid={data.unpaid}
        // paid={data.paid}    
        />
        ))}
    </div>
  )
}

export default OverviewStoryList
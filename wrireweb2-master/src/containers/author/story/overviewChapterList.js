import React from 'react'
import OverviewChapter from './overviewChapter'

let OverviewChapterList = ({chapterData}) => {
  return (
    <div className='overflow-y-scroll h-[220px]'>
        {chapterData.map((data) => (
            <OverviewChapter
            id = {data.id}
            content = {data.content}
            name={data.name}
            paid_stt={data.paid_stt}
            stt={data.stt}
            />
        ))}
    </div>
  )
}

export default OverviewChapterList
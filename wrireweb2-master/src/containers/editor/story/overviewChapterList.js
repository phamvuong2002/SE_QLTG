import React from 'react'
import OverviewChapter from './overviewChapter'

const OverviewChapterList = ({chapterData}) => {
  return (
    <div className='overflow-y-scroll h-[220px]'>
        {chapterData.map((data) => (
            <OverviewChapter
            chapterid={data.chapterid}
            name={data.name}
            paid_stt={data.paid_stt}
            stt={data.stt}
            content={data.content}
            />
        ))}
    </div>
  )
}

export default OverviewChapterList
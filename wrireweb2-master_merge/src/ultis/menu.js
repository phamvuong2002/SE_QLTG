import icons from "./icons"
const {FiPieChart,AiFillEdit, SiSqlite, GiSpellBook, MdAccountCircle, AiFillSetting} = icons

export const sidebaradminMenu = [

    {
        path: 'overview',
        text: 'Overview',
        end: true,
        icons: <FiPieChart size={20} />
    },
    {
        path: 'author',
        text: 'Author',
        end: true,
        icons: <SiSqlite size={20}/>
    },{
        path: 'editor',
        text: 'Editor',
        end: true,
        icons: <AiFillEdit size={20}/>
    },{
        path: 'story',
        text: 'Story',
        end: true,
        icons: <GiSpellBook size={20}/>
    },
    {
        path: 'account',
        text: 'Account',
        end: true,
        icons: <MdAccountCircle size={20}/>
    },
    {
        path: 'setting',
        text: 'Setting',
        end: true,
        icons: <AiFillSetting size={20}/>
    },
]


export const sidebarauthorMenu = [

    {
        path: 'overview',
        text: 'Overview',
        end: true,
        icons: <FiPieChart size={20} />
    },
    {
        path: 'story',
        text: 'Story',
        end: true,
        icons: <GiSpellBook size={20}/>
    },
    {
        path: 'setting',
        text: 'Setting',
        end: true,
        icons: <AiFillSetting size={20}/>
    },
]


export const sidebareditorMenu = [

    {
        path: 'overview',
        text: 'Overview',
        end: true,
        icons: <FiPieChart size={20} />
    },
    {
        path: 'author',
        text: 'Author',
        end: true,
        icons: <SiSqlite size={20}/>
    },{
        path: 'story',
        text: 'Story',
        end: true,
        icons: <GiSpellBook size={20}/>
    },
    {
        path: 'setting',
        text: 'Setting',
        end: true,
        icons: <AiFillSetting size={20}/>
    },
]
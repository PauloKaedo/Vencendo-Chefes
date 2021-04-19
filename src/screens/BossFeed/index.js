import React from 'react'
import { FlatList, View } from 'react-native'
import { Header } from 'react-native-elements'

import { SearchBar, SameLine } from '../../assets/styles'

import staticBoss from '../../assets/boss/boss.json'
import BossCard from '../../components/BossCard'
import Icon from  'react-native-vector-icons/AntDesign'

const FEED_LIMIT = 4

export default class Boss extends React.Component {
    constructor(props) {
        super(props)

        this.state = {
            bossName: null,
            nextPage: 0,
            boss: [],
            loading: false,
            reload: false
        }
    }

    loadBoss = () => {
        const {nextPage, boss, bossName} = this.state

        this.setState({
            loading: true
        })

        if(bossName){
            const bossByName = staticBoss.boss.filter(filtredBoss => filtredBoss.enemy.name.toLowerCase().includes(bossName))

            this.setState({
                boss: bossByName,
                reload: false,
                loading: false
            })
        } else {

            const initialID = nextPage * FEED_LIMIT + 1
            const finalID = initialID + FEED_LIMIT - 1
    
            const loadedBoss = staticBoss.boss.filter((filtredBoss) => filtredBoss.id >= initialID && filtredBoss.id <= finalID)
    
            if (loadedBoss.length){
                this.setState({ 
                    
                    boss: [...boss, ...loadedBoss],
                    nextPage: nextPage + 1,
                    loading: false,
                    reload: false
                })
            } else {
                this.setState({ 
                    
                    reload: false,
                    loading: false,
                })
            }
        }

    }

    stateBossByName = (name) =>{
        console.log(name)
        this.setState({bossName: name})
    }

    showSearch = () => {
        return (
            <>
                <SameLine> 
                    <SearchBar
                        onChangeText={ name => (this.stateBossByName(name)) }
                    ></SearchBar>
                    <Icon 
                        size={20} name='search1'
                        onPress={() => {this.loadBoss()}}
                    ></Icon>
                </SameLine>
            </>
        )
    }

    listBoss = (boss) => {
        const { reload } = this.state
        return(
            <View>
                <Header
                    centerComponent={this.showSearch()}
                >

                </Header>
                <FlatList
                    data = {boss}
                    numColumns = {2}

                    onEndReached = {() => this.loadMoreBoss()}
                    onEndReachedThreshold = {0.5}

                    onRefresh = {() => this.reloadPage()}
                    refreshing = {reload}

                    keyExtractor = {(item) => String(item.id)}
                    renderItem = {({item}) => {
                        return (
                            <View style={{width: '50%'}}>
                                {this.showBoss(item)}
                            </View>
                        )
                    }}
                >
            </FlatList>
            </View>
        )
    }

    reloadPage = () => {
        this.setState({reload: true, boss: [], nextPage: 0, bossName: null}, () => {
            this.loadMoreBoss()
        } )
    }

    showBoss = (item) => {
       return(
        <BossCard bossFeed={item} navigator={this.props.navigation}></BossCard>
       )
    }

    componentDidMount = () => {
        this.loadMoreBoss()
    }

    loadMoreBoss = () => {
        const {loading} = this.state
        if(loading){
            return
        }
        this.loadBoss()
    }

    render = () => {
        const { boss } = this.state

        if (boss.length){
            return (
                this.listBoss(boss)
            )
        } else {
            return (    
                <View></View>
            )
        }
    }
}
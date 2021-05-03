import React from 'react'
import { TouchableOpacity } from 'react-native'
import { Card, CardContent, CardImage } from 'react-native-cards'
import Icon from  'react-native-vector-icons/AntDesign'

import {
    Avatar, GameName, BossName, BossDifficult, EasyCount, DifficultCount, FlavuorText
} from '../../assets/styles'

//import avatar from '../../assets/imgs/nemesis.jpg'
import { getImage } from '../../api'

export default class BossCard extends React.Component{
    constructor (props){
        super(props)

        this.state = {
            bossFeed: this.props.bossFeed,
            navigator: this.props.navigator

        }

    }

    render = () => {
        const { bossFeed, navigator } = this.state
        return(
            <TouchableOpacity onPress = {() =>{
                navigator.navigate("BossShow", {bossId: bossFeed._id, navigator: navigator})
            }}>
            <Card>
                <CardImage source={getImage(bossFeed.enemy.avatar)}></CardImage>
                <CardContent>
                    <BossName>{bossFeed.enemy.name}</BossName>
                </CardContent>
                <CardContent>
                    <GameName>{bossFeed.game.name}</GameName>
                </CardContent>
                <CardContent>
                    <BossDifficult>{bossFeed.enemy.difficulty}</BossDifficult>
                </CardContent>
                <CardContent>
                    <FlavuorText>Aprenda como derrotar {bossFeed.enemy.name} sem dificuldades!</FlavuorText>
                </CardContent>
                <CardContent>
                    <Icon name="heart" size={18}>
                        <EasyCount> {bossFeed.easy}</EasyCount>
                    </Icon>
                    <Icon name="heart" size={18}>
                        <DifficultCount> {bossFeed.hard}</DifficultCount>
                    </Icon>
                </CardContent>
            </Card>
        </TouchableOpacity>
        )
    }
}
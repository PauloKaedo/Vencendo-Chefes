import React from 'react'

import { SliderBox } from 'react-native-image-slider-box'

import CardView from 'react-native-cardview'

import {
    BossNameDetonated, BossDetonatedDescription
} from '../../assets/styles'

import { Card, CardContent } from 'react-native-cards'
import { getBossById, getDetonatedByEnemyId, getImage } from '../../api'


export default class BossShow extends React.Component{

    constructor(props){
        super(props)

        this.state = {
            bossId: this.props.navigation.state.params.bossId,
            boss: null,
            avatar: null,
            detonated: null,
            slides: []
        }
    }

    loadBoss = () => {
        const { bossId } = this.state

        getBossById(bossId).then(selectedBoss => {
            if(selectedBoss.length){
                const {image_1, image_2, image_3} = selectedBoss[0].enemy
                this.setState({
                    boss: selectedBoss[0],
                    slides: [getImage(image_1), getImage(image_2), getImage(image_3)]
                })
            }
        }).catch (err => {
            console.log(err)
        })

        getDetonatedByEnemyId(bossId).then(detonatedResult => {

            
            this.setState({
                detonated: detonatedResult[0].detonated
            })

        }).catch (err => {
            console.log(err)
        })
        
        console.log(this.slides)
        
    }

    componentDidMount = () => {
        this.loadBoss();
    }

    showSlides = () =>{
        const { slides } = this.state

        return(
            <SliderBox
                resizeMethod={'resize'}
                resizeMode={"cover"}

                images={slides}
            >

            </SliderBox>
        )
    }

    render = () =>{
        const { boss,detonated } = this.state

        if(boss){
            return(
                <>
                    <CardView
                        cardElevaton={2}
                        cornerRadius={0}
                    >
                        {this.showSlides()}
                        <BossNameDetonated>{boss.enemy.name}</BossNameDetonated>                                               
                    </CardView>
                    <Card>
                        <CardContent>
                            <BossDetonatedDescription>{detonated}</BossDetonatedDescription>
                        </CardContent>
                    </Card>
                </>
            )
        } else{
            return null
        }
    }
}

const BOSS_URL = 'http://192.168.56.1:5001/'
const COMMENT_URL = 'http://192.168.56.1:5002/'
const DETONATED_URL = 'http://192.168.56.1:5003/'
const IMAGES_URL = 'http://192.168.56.1:8080/'

const getUrl = async (apiUrl, url) => {
    let promise = null

    try {
        let response = await fetch(apiUrl + url, {method: "GET"})
        if (response.ok) {
            promise = Promise.resolve(response.json())
        } else {
            promise = Promise.reject(response)
        }
    } catch (error) {
        promise = Promise.reject(error)
    }

    return promise
}

export const getBossList = async (page) => {
    return getUrl(BOSS_URL, "boss/" + page)
}

export const getBossById = async (id) => {
    return getUrl(BOSS_URL, "bossById/" + id)
}

export const getBossByName = async (name,page) => {
    return getUrl(BOSS_URL, "bossByName/" + name + "/" + page)
}

export const getCommentById = async (id) => {
    return getUrl(COMMENT_URL, "commentById/" + id )
}

export const getDetonatedByEnemyId = async (id) => {
    return getUrl(DETONATED_URL, "detonatedByEnemyId/" + id )
}

export const getImage = (image) => {
    return { uri: IMAGES_URL + image }
}
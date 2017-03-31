module Decoders exposing (..)

import Json.Decode as D exposing (..)
import Dict
import Json.Decode.Pipeline exposing (decode, required)


type alias Behance =
    { project : BehanceProject
    , httpCode : Int
    }


type alias Owner =
    { id : Int
    , firstName : String
    , lastName : String
    , username : String
    , city : String
    , state : String
    , country : String
    , location : String
    , company : String
    , occupation : String
    , createdOn : Int
    , url : String
    , images : Dict.Dict String String
    , displayName : String
    , fields : List String
    , hasDefaultImage : Int
    , website : String
    , stats : OwnerStats
    }


type alias OwnerStats =
    { followers : Int
    , following : Int
    , appreciations : Int
    , views : Int
    , comments : Int
    }


decodeOwner : D.Decoder Owner
decodeOwner =
    decode Owner
        |> required "id" (D.int)
        |> required "firstName" (D.string)
        |> required "lastName" (D.string)
        |> required "username" (D.string)
        |> required "city" (D.string)
        |> required "state" (D.string)
        |> required "country" (D.string)
        |> required "location" (D.string)
        |> required "company" (D.string)
        |> required "occupation" (D.string)
        |> required "createdOn" (D.int)
        |> required "url" (D.string)
        |> required "images" (D.dict string)
        |> required "displayName" (D.string)
        |> required "fields" (D.list D.string)
        |> required "hasDefaultImage" (D.int)
        |> required "website" (D.string)
        |> required "stats" (decodeOwnerStats)



-- decodeOwnerImages : D.Decoder OwnerImages
-- decodeOwnerImages =
--     decode OwnerImages
--         |> required "50" (D.string)
--         |> required "100" (D.string)
--         |> required "115" (D.string)
--         |> required "138" (D.string)
--         |> required "230" (D.string)
--         |> required "276" (D.string)


decodeOwnerStats : D.Decoder OwnerStats
decodeOwnerStats =
    decode OwnerStats
        |> required "followers" (D.int)
        |> required "following" (D.int)
        |> required "appreciations" (D.int)
        |> required "views" (D.int)
        |> required "comments" (D.int)



-- type alias BehanceProjectCovers =
--     { 115 : String
--     , 202 : String
--     , 230 : String
--     , 404 : String
--     , original : String
--     }


type alias BehanceProjectStats =
    { views : Int
    , appreciations : Int
    , comments : Int
    }


type alias BehanceProjectCopyright =
    { license : String
    , description : String
    , licenseId : Int
    }


type alias BehanceProjectStylesTextTitle =
    { fontFamily : String
    , fontWeight : String
    , color : String
    , textAlign : String
    , lineHeight : String
    , fontSize : String
    , textDecoration : String
    , fontStyle : String
    , display : String
    , textTransform : String
    }


type alias BehanceProjectStylesTextSubtitle =
    { fontFamily : String
    , fontWeight : String
    , color : String
    , textAlign : String
    , lineHeight : String
    , fontSize : String
    , textDecoration : String
    , fontStyle : String
    , display : String
    , textTransform : String
    }


type alias BehanceProjectStylesTextParagraph =
    { fontFamily : String
    , fontWeight : String
    , color : String
    , textAlign : String
    , lineHeight : String
    , fontSize : String
    , textDecoration : String
    , fontStyle : String
    , display : String
    , textTransform : String
    }


type alias BehanceProjectStylesTextCaption =
    { fontFamily : String
    , fontWeight : String
    , color : String
    , textAlign : String
    , lineHeight : String
    , fontSize : String
    , textDecoration : String
    , fontStyle : String
    , display : String
    , textTransform : String
    }


type alias BehanceProjectStylesTextLink =
    { fontFamily : String
    , fontWeight : String
    , color : String
    , textAlign : String
    , lineHeight : String
    , fontSize : String
    , textDecoration : String
    , fontStyle : String
    , display : String
    , textTransform : String
    }


type alias BehanceProjectStylesText =
    { title : BehanceProjectStylesTextTitle
    , subtitle : BehanceProjectStylesTextSubtitle
    , paragraph : BehanceProjectStylesTextParagraph
    , caption : BehanceProjectStylesTextCaption
    , link : BehanceProjectStylesTextLink
    }


type alias BehanceProjectStylesBackground =
    { color : String
    }


type alias BehanceProjectStylesSpacingProject =
    { topMargin : String
    }


type alias BehanceProjectStylesSpacingModules =
    { bottomMargin : String
    }


type alias BehanceProjectStylesSpacing =
    { project : BehanceProjectStylesSpacingProject
    , modules : BehanceProjectStylesSpacingModules
    }


type alias BehanceProjectStylesDividers =
    { display : String
    }


type alias BehanceProjectStyles =
    { text : BehanceProjectStylesText
    , background : BehanceProjectStylesBackground
    , spacing : BehanceProjectStylesSpacing
    , dividers : BehanceProjectStylesDividers
    }


type alias BehanceProject =
    { id : Int
    , name : String
    , publishedOn : Int
    , createdOn : Int
    , modifiedOn : Int
    , url : String
    , privacy : String
    , fields : List String
    , covers : Dict.Dict String String
    , matureContent : Int
    , matureAccess : String
    , owners : List Owner
    , stats : BehanceProjectStats
    , conceivedOn : Int
    , canvasWidth : Int
    , tags : List String
    , description : String
    , editorVersion : Int
    , allowComments : Int
    , modules : List BModule
    , shortUrl : String
    , copyright : BehanceProjectCopyright
    , tools : List Tool
    , features : List Feature
    , styles : BehanceProjectStyles
    , creatorId : Int
    }


type alias Feature =
    { featuredOn : Int
    , site : FeatureSite
    , url : String
    }


type alias FeatureSiteRibbon =
    { image : String
    , image2x : String
    }


type alias FeatureSite =
    { id : Int
    , name : String
    , key : String
    , icon : String
    , url : String
    , domain : String
    , ribbon : FeatureSiteRibbon
    }


decodeFeature : D.Decoder Feature
decodeFeature =
    decode Feature
        |> required "featuredOn" (D.int)
        |> required "site" (decodeFeatureSite)
        |> required "url" (D.string)


decodeFeatureSiteRibbon : D.Decoder FeatureSiteRibbon
decodeFeatureSiteRibbon =
    decode FeatureSiteRibbon
        |> required "image" (D.string)
        |> required "image2x" (D.string)


decodeFeatureSite : D.Decoder FeatureSite
decodeFeatureSite =
    decode FeatureSite
        |> required "id" (D.int)
        |> required "name" (D.string)
        |> required "key" (D.string)
        |> required "icon" (D.string)
        |> required "url" (D.string)
        |> required "domain" (D.string)
        |> required "ribbon" (decodeFeatureSiteRibbon)


type alias BModule =
    { id : Int
    , projectId : Int
    , type_ : String
    , fullBleed : Int
    , alignment : String
    , captionAlignment : String
    , src : String
    , sizes : BModuleSizes
    , dimensions : BModuleDimensions
    , width : Int
    , height : Int
    }


type alias Tool =
    { id : Int
    , title : String
    , category : String
    , categoryLabel : String
    , categoryId : Int
    , synonym : Maybe String
    , approved : String
    , url : String
    }


decodeTool : D.Decoder Tool
decodeTool =
    decode Tool
        |> required "id" (D.int)
        |> required "title" (D.string)
        |> required "category" (D.string)
        |> required "categoryLabel" (D.string)
        |> required "categoryId" (D.int)
        |> required "synonym" (D.maybe string)
        |> required "approved" (D.string)
        |> required "url" (D.string)


type alias BModuleSizes =
    { one_400 : String
    , disp : String
    , max1240 : String
    , max1920 : String
    , max1200 : String
    , max3840 : String
    , original : String
    }


type alias BModuleDimensions1400 =
    { width : Int
    , height : Int
    }


type alias BModuleDimensionsDisp =
    { width : Int
    , height : Int
    }


type alias BModuleDimensionsMax_1240 =
    { width : Int
    , height : Int
    }


type alias BModuleDimensionsMax_1920 =
    { width : Int
    , height : Int
    }


type alias BModuleDimensionsMax_1200 =
    { width : Int
    , height : Int
    }


type alias BModuleDimensionsMax_3840 =
    { width : Int
    , height : Int
    }


type alias BModuleDimensionsOriginal =
    { width : Int
    , height : Int
    }


type alias BModuleDimensions =
    { one_400 : BModuleDimensions1400
    , disp : BModuleDimensionsDisp
    , max1240 : BModuleDimensionsMax_1240
    , max1920 : BModuleDimensionsMax_1920
    , max1200 : BModuleDimensionsMax_1200
    , max3840 : BModuleDimensionsMax_3840
    , original : BModuleDimensionsOriginal
    }


decodeBModule : D.Decoder BModule
decodeBModule =
    decode BModule
        |> required "id" (D.int)
        |> required "projectId" (D.int)
        |> required "type" (D.string)
        |> required "fullBleed" (D.int)
        |> required "alignment" (D.string)
        |> required "captionAlignment" (D.string)
        |> required "src" (D.string)
        |> required "sizes" (decodeBModuleSizes)
        |> required "dimensions" (decodeBModuleDimensions)
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleSizes : D.Decoder BModuleSizes
decodeBModuleSizes =
    decode BModuleSizes
        |> required "1400" (D.string)
        |> required "disp" (D.string)
        |> required "max1240" (D.string)
        |> required "max1920" (D.string)
        |> required "max1200" (D.string)
        |> required "max3840" (D.string)
        |> required "original" (D.string)


decodeBModuleDimensions1400 : D.Decoder BModuleDimensions1400
decodeBModuleDimensions1400 =
    decode BModuleDimensions1400
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleDimensionsDisp : D.Decoder BModuleDimensionsDisp
decodeBModuleDimensionsDisp =
    decode BModuleDimensionsDisp
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleDimensionsMax_1240 : D.Decoder BModuleDimensionsMax_1240
decodeBModuleDimensionsMax_1240 =
    decode BModuleDimensionsMax_1240
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleDimensionsMax_1920 : D.Decoder BModuleDimensionsMax_1920
decodeBModuleDimensionsMax_1920 =
    decode BModuleDimensionsMax_1920
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleDimensionsMax_1200 : D.Decoder BModuleDimensionsMax_1200
decodeBModuleDimensionsMax_1200 =
    decode BModuleDimensionsMax_1200
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleDimensionsMax_3840 : D.Decoder BModuleDimensionsMax_3840
decodeBModuleDimensionsMax_3840 =
    decode BModuleDimensionsMax_3840
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleDimensionsOriginal : D.Decoder BModuleDimensionsOriginal
decodeBModuleDimensionsOriginal =
    decode BModuleDimensionsOriginal
        |> required "width" (D.int)
        |> required "height" (D.int)


decodeBModuleDimensions : D.Decoder BModuleDimensions
decodeBModuleDimensions =
    decode BModuleDimensions
        |> required "1400" (decodeBModuleDimensions1400)
        |> required "disp" (decodeBModuleDimensionsDisp)
        |> required "max1240" (decodeBModuleDimensionsMax_1240)
        |> required "max1920" (decodeBModuleDimensionsMax_1920)
        |> required "max1200" (decodeBModuleDimensionsMax_1200)
        |> required "max3840" (decodeBModuleDimensionsMax_3840)
        |> required "original" (decodeBModuleDimensionsOriginal)


decodeBehance : D.Decoder Behance
decodeBehance =
    decode Behance
        |> required "project" (decodeBehanceProject)
        |> required "httpCode" (D.int)



--
-- decodeBehanceProjectCovers : D.Decoder BehanceProjectCovers
-- decodeBehanceProjectCovers =
--     decode BehanceProjectCovers
--         |> required "115" (D.string)
--         |> required "202" (D.string)
--         |> required "230" (D.string)
--         |> required "404" (D.string)
--         |> required "original" (D.string)


decodeBehanceProjectStats : D.Decoder BehanceProjectStats
decodeBehanceProjectStats =
    decode BehanceProjectStats
        |> required "views" (D.int)
        |> required "appreciations" (D.int)
        |> required "comments" (D.int)


decodeBehanceProjectCopyright : D.Decoder BehanceProjectCopyright
decodeBehanceProjectCopyright =
    decode BehanceProjectCopyright
        |> required "license" (D.string)
        |> required "description" (D.string)
        |> required "licenseId" (D.int)


decodeBehanceProjectStylesTextTitle : D.Decoder BehanceProjectStylesTextTitle
decodeBehanceProjectStylesTextTitle =
    decode BehanceProjectStylesTextTitle
        |> required "fontFamily" (D.string)
        |> required "fontWeight" (D.string)
        |> required "color" (D.string)
        |> required "textAlign" (D.string)
        |> required "lineHeight" (D.string)
        |> required "fontSize" (D.string)
        |> required "textDecoration" (D.string)
        |> required "fontStyle" (D.string)
        |> required "display" (D.string)
        |> required "textTransform" (D.string)


decodeBehanceProjectStylesTextSubtitle : D.Decoder BehanceProjectStylesTextSubtitle
decodeBehanceProjectStylesTextSubtitle =
    decode BehanceProjectStylesTextSubtitle
        |> required "fontFamily" (D.string)
        |> required "fontWeight" (D.string)
        |> required "color" (D.string)
        |> required "textAlign" (D.string)
        |> required "lineHeight" (D.string)
        |> required "fontSize" (D.string)
        |> required "textDecoration" (D.string)
        |> required "fontStyle" (D.string)
        |> required "display" (D.string)
        |> required "textTransform" (D.string)


decodeBehanceProjectStylesTextParagraph : D.Decoder BehanceProjectStylesTextParagraph
decodeBehanceProjectStylesTextParagraph =
    decode BehanceProjectStylesTextParagraph
        |> required "fontFamily" (D.string)
        |> required "fontWeight" (D.string)
        |> required "color" (D.string)
        |> required "textAlign" (D.string)
        |> required "lineHeight" (D.string)
        |> required "fontSize" (D.string)
        |> required "textDecoration" (D.string)
        |> required "fontStyle" (D.string)
        |> required "display" (D.string)
        |> required "textTransform" (D.string)


decodeBehanceProjectStylesTextCaption : D.Decoder BehanceProjectStylesTextCaption
decodeBehanceProjectStylesTextCaption =
    decode BehanceProjectStylesTextCaption
        |> required "fontFamily" (D.string)
        |> required "fontWeight" (D.string)
        |> required "color" (D.string)
        |> required "textAlign" (D.string)
        |> required "lineHeight" (D.string)
        |> required "fontSize" (D.string)
        |> required "textDecoration" (D.string)
        |> required "fontStyle" (D.string)
        |> required "display" (D.string)
        |> required "textTransform" (D.string)


decodeBehanceProjectStylesTextLink : D.Decoder BehanceProjectStylesTextLink
decodeBehanceProjectStylesTextLink =
    decode BehanceProjectStylesTextLink
        |> required "fontFamily" (D.string)
        |> required "fontWeight" (D.string)
        |> required "color" (D.string)
        |> required "textAlign" (D.string)
        |> required "lineHeight" (D.string)
        |> required "fontSize" (D.string)
        |> required "textDecoration" (D.string)
        |> required "fontStyle" (D.string)
        |> required "display" (D.string)
        |> required "textTransform" (D.string)


decodeBehanceProjectStylesText : D.Decoder BehanceProjectStylesText
decodeBehanceProjectStylesText =
    decode BehanceProjectStylesText
        |> required "title" (decodeBehanceProjectStylesTextTitle)
        |> required "subtitle" (decodeBehanceProjectStylesTextSubtitle)
        |> required "paragraph" (decodeBehanceProjectStylesTextParagraph)
        |> required "caption" (decodeBehanceProjectStylesTextCaption)
        |> required "link" (decodeBehanceProjectStylesTextLink)


decodeBehanceProjectStylesBackground : D.Decoder BehanceProjectStylesBackground
decodeBehanceProjectStylesBackground =
    decode BehanceProjectStylesBackground
        |> required "color" (D.string)


decodeBehanceProjectStylesSpacingProject : D.Decoder BehanceProjectStylesSpacingProject
decodeBehanceProjectStylesSpacingProject =
    decode BehanceProjectStylesSpacingProject
        |> required "topMargin" (D.string)


decodeBehanceProjectStylesSpacingModules : D.Decoder BehanceProjectStylesSpacingModules
decodeBehanceProjectStylesSpacingModules =
    decode BehanceProjectStylesSpacingModules
        |> required "bottomMargin" (D.string)


decodeBehanceProjectStylesSpacing : D.Decoder BehanceProjectStylesSpacing
decodeBehanceProjectStylesSpacing =
    decode BehanceProjectStylesSpacing
        |> required "project" (decodeBehanceProjectStylesSpacingProject)
        |> required "modules" (decodeBehanceProjectStylesSpacingModules)


decodeBehanceProjectStylesDividers : D.Decoder BehanceProjectStylesDividers
decodeBehanceProjectStylesDividers =
    decode BehanceProjectStylesDividers
        |> required "display" (D.string)


decodeBehanceProjectStyles : D.Decoder BehanceProjectStyles
decodeBehanceProjectStyles =
    decode BehanceProjectStyles
        |> required "text" (decodeBehanceProjectStylesText)
        |> required "background" (decodeBehanceProjectStylesBackground)
        |> required "spacing" (decodeBehanceProjectStylesSpacing)
        |> required "dividers" (decodeBehanceProjectStylesDividers)


decodeBehanceProject : D.Decoder BehanceProject
decodeBehanceProject =
    decode BehanceProject
        |> required "id" (D.int)
        |> required "name" (D.string)
        |> required "publishedOn" (D.int)
        |> required "createdOn" (D.int)
        |> required "modifiedOn" (D.int)
        |> required "url" (D.string)
        |> required "privacy" (D.string)
        |> required "fields" (D.list D.string)
        |> required "covers" (D.dict string)
        |> required "matureContent" (D.int)
        |> required "matureAccess" (D.string)
        |> required "owners" (D.list decodeOwner)
        |> required "stats" (decodeBehanceProjectStats)
        |> required "conceivedOn" (D.int)
        |> required "canvasWidth" (D.int)
        |> required "tags" (D.list D.string)
        |> required "description" (D.string)
        |> required "editorVersion" (D.int)
        |> required "allowComments" (D.int)
        |> required "modules" (D.list decodeBModule)
        |> required "shortUrl" (D.string)
        |> required "copyright" (decodeBehanceProjectCopyright)
        |> required "tools" (D.list decodeTool)
        |> required "features" (D.list decodeFeature)
        |> required "styles" (decodeBehanceProjectStyles)
        |> required "creatorId" (D.int)

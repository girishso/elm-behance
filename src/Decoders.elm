module Decoders exposing (..)

import Json.Decode as D exposing (..)
import Dict
import Json.Decode.Pipeline exposing (decode, required, optional)


type alias Behance =
    { project : Project
    , http_code : Int
    }


initialBPrj : Behance
initialBPrj =
    { http_code = 0, project = initial_BPrjProject }


type alias Comment =
    { comment : String
    , created_on : Int
    , user : CommentUser
    }


type alias Comments =
    { comments : List Comment
    }


type alias Projects =
    { projects : List Project
    }


type alias CommentUser =
    { display_name : String
    , images : Dict.Dict String String
    }


decodeComments : D.Decoder Comments
decodeComments =
    decode Comments
        |> required "comments" (D.list decodeComment)


decodeProjects : D.Decoder Projects
decodeProjects =
    decode Projects
        |> required "projects" (D.list decodeBPrjProject)


decodeComment : D.Decoder Comment
decodeComment =
    decode Comment
        |> required "comment" (D.string)
        |> required "created_on" (D.int)
        |> required "user" (decodeCommentUser)


decodeCommentUser : D.Decoder CommentUser
decodeCommentUser =
    decode CommentUser
        |> required "display_name" (D.string)
        |> required "images" (D.dict string)


type alias BPrjProjectStats =
    { views : Int
    , appreciations : Int
    , comments : Int
    }


type alias ProjectModule =
    { type_ : String
    , src : String
    , text_plain : String
    }


initial_BPrjProject : Project
initial_BPrjProject =
    { id = 0
    , name = ""
    , published_on = 0
    , created_on = 0
    , modified_on = 0
    , url = ""
    , privacy = ""
    , fields = []
    , covers = Dict.empty
    , mature_content = 0
    , mature_access = ""
    , owners = []
    , conceived_on = 0
    , canvas_width = 0
    , tags = []
    , description = ""
    , editor_version = 0
    , allow_comments = 0
    , modules = []
    , short_url = ""
    , creator_id = 0
    }


type alias Project =
    { id : Int
    , name : String
    , published_on : Int
    , created_on : Int
    , modified_on : Int
    , url : String
    , privacy : String
    , fields : List String
    , covers : Dict.Dict String String
    , mature_content : Int
    , mature_access : String
    , owners :
        List BPrjProjectOwner
        -- , stats : bprj_project_stats
    , conceived_on : Int
    , canvas_width : Int
    , tags : List String
    , description : String
    , editor_version : Int
    , allow_comments :
        Int
    , modules : List ProjectModule
    , short_url :
        String
        -- , copyright : BPrjProjectCopyright
        -- , tools :
        --     List String
        -- , features : BPrjProjectFeatures
        -- , styles : BPrjProjectStyles
    , creator_id : Int
    }


type alias BPrjProjectOwner =
    { location : String
    , images : Dict.Dict String String
    , display_name : String
    }


decodeBPrjProjectOwner : D.Decoder BPrjProjectOwner
decodeBPrjProjectOwner =
    decode BPrjProjectOwner
        |> required "location" (D.string)
        |> required "images" (D.dict string)
        |> required "display_name" (D.string)


decodeBPrj : D.Decoder Behance
decodeBPrj =
    decode Behance
        |> required "project" (decodeBPrjProject)
        |> required "http_code" (D.int)


decodeBPrjs : D.Decoder (List Project)
decodeBPrjs =
    D.list decodeBPrjProject


decodeBPrjProjectStats : D.Decoder BPrjProjectStats
decodeBPrjProjectStats =
    decode BPrjProjectStats
        |> required "views" (D.int)
        |> required "appreciations" (D.int)
        |> required "comments" (D.int)


decodeBPrjProject : D.Decoder Project
decodeBPrjProject =
    decode Project
        |> required "id" (D.int)
        |> required "name" (D.string)
        |> required "published_on" (D.int)
        |> required "created_on" (D.int)
        |> required "modified_on" (D.int)
        |> required "url" (D.string)
        |> required "privacy" (D.string)
        |> required "fields" (D.list D.string)
        |> required "covers" (D.dict string)
        |> required "mature_content" (D.int)
        |> required "mature_access" (D.string)
        |> required "owners" (D.list decodeBPrjProjectOwner)
        |> required "conceived_on" (D.int)
        |> optional "canvas_width" (D.int) 0
        |> optional "tags" (D.list D.string) []
        |> optional "description" (D.string) ""
        |> optional "editor_version" (D.int) 0
        |> optional "allow_comments" (D.int) 0
        |> optional "modules" (D.list decodeBPrjProjectModule) []
        |> optional "short_url" (D.string) ""
        |> optional "creator_id" (D.int) 0


decodeBPrjProjectModule : D.Decoder ProjectModule
decodeBPrjProjectModule =
    decode ProjectModule
        |> required "type" (D.string)
        |> optional "src" (D.string) "MISSING"
        |> optional "text_plain" (D.string) "MISSING"



-- |> required "tools" (D.list D.string)
--
-- |> required "stats" (decodeBPrjProjectStats)
-- |> required "modules" (decodeBPrjProjectModules)
-- |> required "copyright" (decodeBPrjProjectCopyright)
-- |> required "features" (decodeBPrjProjectFeatures)
-- |> required "styles" (decodeBPrjProjectStyles)

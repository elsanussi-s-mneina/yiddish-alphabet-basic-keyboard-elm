-- Code Worked at Elm Playground when replacing the code at https://elm-lang.org/examples/buttons
import Browser
import Html exposing (text)
import Html.Attributes
import Html.Events exposing (onClick)


whiteSpaceCharacters = [
  { text= " ", buttonLabel= "[space]", description= "add space" },
  { text= "\n", buttonLabel= "[start new line]", description= "start new line" },
  { text= "\t", buttonLabel= "[indent]", description= "indent" }]



yiddishAlphabet = [
    { text= "\u{05D0}", buttonLabel= "\u{05D0} shtumer alef", description= "shtumer alef" },
    { text= "\u{05D0}\u{05B7}", buttonLabel= "\u{05D0}\u{05B7} pasekh alef", description= "pasekh alef" },
    { text= "\u{05D0}\u{05B8}", buttonLabel= "\u{05D0}\u{05B8} komets alef", description= "komets alef" },
    { text= "\u{05D1}", buttonLabel= "\u{05D1} beys", description= "beys" },
    { text= "\u{05D1}\u{05BF}", buttonLabel= "\u{05D1}\u{05BF} veys", description= "veys" },
    { text= "\u{05D2}", buttonLabel= "\u{05D2} giml", description= "giml" },
    { text= "\u{05D3}", buttonLabel= "\u{05D3} daled", description= "daled" },
    { text= "\u{05D4}", buttonLabel= "\u{05D4} hey", description= "hey" },
    { text= "\u{05D5}", buttonLabel= "\u{05D5} vov", description= "vov" },
    { text= "\u{05D5}\u{05BC}", buttonLabel= "\u{05D5}\u{05BC} melupm vov", description= "melupm vov" },
    { text= "\u{05D6}", buttonLabel= "\u{05D6} zayen", description= "zayen" },
    { text= "\u{05D7}", buttonLabel= "\u{05D7} khes", description= "khes" },
    { text= "\u{05D8}", buttonLabel= "\u{05D8} tes", description= "tes" },
    { text= "\u{05D9}", buttonLabel= "\u{05D9} yud", description= "yud" },
    { text= "\u{05DB}\u{05BC}", buttonLabel= "\u{05DB}\u{05BC} kof", description= "kof" },
    { text= "\u{05DB}", buttonLabel= "\u{05DB} khof", description= "khof" },
    { text= "\u{05DA}", buttonLabel= "\u{05DA} langer khof", description= "langer khof" },
    { text= "\u{05DC}", buttonLabel= "\u{05DC} lamed", description= "lamed" },
    { text= "\u{05DE}", buttonLabel= "\u{05DE} mem", description= "mem" },
    { text= "\u{05DD}", buttonLabel= "\u{05DD} shlos mem", description= "shlos mem" },
    { text= "\u{05E0}", buttonLabel= "\u{05E0} nun", description= "nun" },
    { text= "\u{05DF}", buttonLabel= "\u{05DF} langer nun", description= "langer nun" },
    { text= "\u{05E1}", buttonLabel= "\u{05E1} samekh", description= "samekh" },
    { text= "\u{05E2}", buttonLabel= "\u{05E2} ayen", description= "ayen" },
    { text= "\u{05E4}\u{05BC}", buttonLabel= "\u{05E4}\u{05BC} pey", description= "pey" },
    { text= "\u{05E4}\u{05BF}", buttonLabel= "\u{05E4}\u{05BF} fey", description= "fey" },
    { text= "\u{05E3}", buttonLabel= "\u{05E3} langer fey", description= "langer fey" },
    { text= "\u{05E6}", buttonLabel= "\u{05E6} tsadek", description= "tsadek" },
    { text= "\u{05E5}", buttonLabel= "\u{05E5} langer tsadek", description= "langer tsadek" },
    { text= "\u{05E7}", buttonLabel= "\u{05E7} kuf", description= "kuf" },
    { text= "\u{05E8}", buttonLabel= "\u{05E8} reysh", description= "reysh" },
    { text= "\u{05E9}", buttonLabel= "\u{05E9} shin", description= "shin" },
    { text= "\u{05E9}\u{05C2}", buttonLabel= "\u{05E9}\u{05C2} sin", description= "sin" },
    { text= "\u{05EA}\u{05BC}", buttonLabel= "\u{05EA}\u{05BC} tof", description= "tof" },
    { text= "\u{05EA}", buttonLabel= "\u{05EA} sof", description= "sof" }
    ]

punctuationCharacters = [
    { text= ".", buttonLabel= ".", description= "." },
    { text= ",", buttonLabel= ",", description= "," },
    { text= "?", buttonLabel= "?", description= "?" },
    { text= ";", buttonLabel= ";", description= ";" },
    { text= ":", buttonLabel= ":", description= "=" },
    { text= "\u{05F3}", buttonLabel= "\u{05F3} geresh", description= "\u{05F3} geresh" },
    { text= "\u{05F4}", buttonLabel= "\u{05F4} gershayim", description= "\u{05F4} gershayim" }
    ]

letterCombinations = [
    { text= "\u{05D5}\u{05D5}", buttonLabel= "\u{05D5}\u{05D5}", description= "\u{05D5}\u{05D5}" },
    { text= "\u{05D6}\u{05E9}", buttonLabel= "\u{05D6}\u{05E9}", description= "\u{05D6}\u{05E9}" },
    { text= "\u{05D3}\u{05D6}\u{05E9}", buttonLabel= "\u{05D3}\u{05D6}\u{05E9}", description= "\u{05D3}\u{05D6}\u{05E9}" },
    { text= "\u{05D8}\u{05E9}", buttonLabel= "\u{05D8}\u{05E9}", description= "\u{05D8}\u{05E9}" },
    { text= "\u{05D5}\u{05E9}", buttonLabel= "\u{05D5}\u{05E9}", description= "\u{05D5}\u{05E9}" },
    { text= "\u{05E9}\u{05E9}", buttonLabel= "\u{05E9}\u{05E9}", description= "\u{05E9}\u{05E9}" },
    { text= "\u{05F2}\u{05B7}", buttonLabel= "\u{05F2}\u{05B7}", description= "\u{05F2}\u{05B7}" }
    ]





buttonFrom {text, buttonLabel, description} = Html.button [onClick (Increment text)] [Html.text buttonLabel]





-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = String


init : Model
init =
  ""



-- UPDATE


type Msg
  = Increment String
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment a ->
      model ++ a

    Decrement ->
      model



-- VIEW


view : Model -> Html.Html Msg
view model =
  Html.p [] (
    [Html.h1 [] [Html.text "Yiddish Alphabet Keyboard"]]
    ++ [Html.textarea [Html.Attributes.value model, Html.Attributes.dir "rtl"] []]
    ++ [Html.h2 [] [Html.text "Spacing"]]
    ++ List.map buttonFrom whiteSpaceCharacters
    ++ [Html.h2 [] [Html.text "Punctuation"]]
    ++ List.map buttonFrom punctuationCharacters    
    ++ [Html.h2 [] [Html.text "Alphabet"]]
    ++ List.map buttonFrom yiddishAlphabet
    ++ [Html.h2 [] [Html.text "Letter Combinations"]]
    ++ List.map buttonFrom letterCombinations
    ++ [Html.footer [] 
      [
        Html.a [Html.Attributes.href "https://yivo.org/Yiddish-Alphabet"] [Html.text "About the Yiddish Alef-BEYS (ALPHABET)"]
      ]
      ]
  )

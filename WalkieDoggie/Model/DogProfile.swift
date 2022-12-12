import Foundation
import CoreLocation


enum Sex {
    case female
    case male
    case both
}


    enum Breed : String, CaseIterable, Identifiable {
    
    var id : String { UUID().uuidString }
    
    case germanShepherd = "German Shepherd"
    case labrador = "Labrador"
    case frenchBulldog = "French Bulldog"
    case goldenRetriever = "Golden Retriever"
    case borderCollie = "Border Collie"
    case corgi = "Corgi"
    case americanStaffordshireTerrier = "American Staffordshire Terrier"
    case poodle = "poodle"
    case theBankerDogHotosho = "the banker doghotsho"
    case hamstaff = "Hamstaff"
    case cardiganWelshCorgi = "Cardigan Welsh Corgi"
    case alabai = "Alabai"
    case labradorRetriever = "Labrador Retriever"
    case pomeranian = "pomeranian"
}


struct DogProfile {
    let id: UUID = UUID()
    var name: String
    var age: Int
    var pictures: [String]
    var description: String
    
    let sex: Sex
    let breed: Breed

    var latitude: Double
    var longitude: Double
    
    var sexPreference: Sex = Sex.both
    var maxDistance: Double = 15_000 //meters?
    var breedPreferences: [String] = ["","",""]
}


var dogExample = DogProfile(name: "Luna", age: 2, pictures: ["dogExample1","dogExample2","dogExample3"], description: "I am very cute and i love running in the grass. my owner loves me so much and i am willing to meet you all. my favourite food is cat food even if i'm a dog", sex: Sex.male, breed: .borderCollie, latitude: 0.0, longitude: 0.0)

var aria = DogProfile(name: "aria", age: 10, pictures: ["",""], description: "sss", sex: Sex.male, breed: Breed.goldenRetriever, latitude: 40.82669, longitude: 14.504204)


var loki = DogProfile(name: "Loki", age: 2, pictures: ["Liza3-Loki-1","Liza3-Loki-2"], description: "Loves pancakes badly and helps to clean house to get them more.", sex: Sex.male, breed: Breed.americanStaffordshireTerrier, latitude: 40.82669, longitude: 14.504204)

var leo = DogProfile(name: "Leo", age: 2, pictures: ["Kalkold1-Leo-1","Kalkold1-Leo-2","Kalkold1-Leo-3", "Kalkold1-Leo-4", "Kalkold1-Leo-5", "Kalkold1-Leo-6"], description: "Real brother.Likes to keep me company every moment of the day and is always close to me like my shadow. He likes being with me especially when it's time to go to bed or to go downstairs: it's precisely in these moments that he gives his best. In bed he releases his sweetest part constantly asking to be pampered and when we go out each sprig can be a very good ball that he will never bring back to me but, instead, he will keep it in his mouth as if to say \"now is your time, let's see if you can pick it up!\".", sex: Sex.male, breed: .poodle, latitude: 40.876806, longitude: 14.343693)

var shakh = DogProfile(name: "Shakh", age: 1, pictures: ["Aryuna1-Shakh-1","Aryuna1-Shakh-2","Aryuna1-Shakh-3", "Aryuna1-Shakh-4"], description: "Likes to play with toys and run around the fence. Knows how to protect the house)) that's all his talents. The most important advantage is that he is large and intimidating in appearance)", sex: Sex.male, breed: .theBankerDogHotosho, latitude: 51.842631, longitude: 107.599314)

var kiraQueen = DogProfile(name: "Kira Queen", age: 8, pictures: ["Koira1-Kira-1","Koira1-Kira-2","Koira1-Kira-3", "Koira1-Kira-4"], description: "Weight: a lot but she doesn't know and act like she's 200g. Favorite toy: everything that can chew and hide. Love: belly rubs and chicken meat. Hate: my sister and my nephew (they like to do makeup training on her).", sex: Sex.female, breed: .hamstaff, latitude: 40.811340, longitude: 14.348950)

var ciri = DogProfile(name: "Ciri", age: 2, pictures: ["Tanya1-Ciri-1","Tanya1-Ciri-2","Tanya1-Ciri-3", "Tanya1-Ciri-4", "Tanya1-Ciri-5", "Tanya1-Ciri-6", "Tanya1-Ciri-7", "Tanya1-Ciri-8"], description: "Ciri is a very sociable girl, loves to communicate with other dogs! And even fell in love with one cat😁 She is active, so if you wants go runing, it's for her!", sex: Sex.female, breed: .cardiganWelshCorgi, latitude: 40.856003, longitude: 14.209037)

var altai = DogProfile(name: "Altai", age: 1, pictures: ["Liza2-Altai-1","Liza2-Altai-2"], description: "Kind, with a finely organized nervous system, therefore often sad. Loves People and prefers their company", sex: Sex.male, breed: .alabai, latitude: 40.842973, longitude: 14.230078)

var albus = DogProfile(name: "Albus", age: 1, pictures: ["Liza1-Albus-1"], description: "A real Italian, eats only high-quality pizza, and doesn't when it's from neighbors. Knows commands, likes to swim in his jacuzzi, has a friendship with a snake from IKEA.", sex: Sex.male, breed: .labradorRetriever, latitude: 40.913367, longitude: 14.308305)

var lui = DogProfile(name: "Lui", age: 5, pictures: ["Liza4-Lui-1","Liza4-Lui-2","Liza4-Lui-3", "Liza4-Lui-4", "Liza4-Lui-5"], description: "received not only a name from the French king, but also habits. He has his own living space, a sofa, prefers to steal cat food rather than eat his own, is obese, although he runs every day. Wakes up the hostess in the morning", sex: Sex.male, breed: .pomeranian, latitude: 40.847303, longitude: 14.265890)

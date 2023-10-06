import UIKit

var greeting = "Hello, playground"
//1. შექმენით enum-ი სახელით DayOfWeek შესაბამისი ქეისებით. დაწერეთ function რომელიც იღებს ამ ენამის ტიპს. function-მა უნდა და-print-ოს, გადაწოდებული დღე კვირის დღეა თუ დასვენების.

enum DayOfWeek: String {
    case monday = "theFirstWorkDay"
    case tuesday = "theSecodnWorkDay"
    case wednesday = "theThirdtWorkDay"
    case thursday = "theFourthWorkDay"
    case friday = "theFifthWorkDay"
    case saturday = "theFirstfreeDay"
    case sunday = "theSecondfreeDay"
}

func printDayOfWeek(weekDays: DayOfWeek) {
    print(weekDays.rawValue)
}

printDayOfWeek(weekDays: .monday)


//the second version

enum DayOfWeek1 {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
}

func checkDayType(weekDays: DayOfWeek1) {
    switch weekDays {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("is a weekday.")
    case .saturday, .sunday:
       print("is a holiday.")
    }
}

checkDayType(weekDays: .monday)



//2. შექმენით enum-ი Weather შემდეგი ქეისებით, Sunny, Cloudy, Rainy და Snowy. ამ ქეისებს უნდა ჰქონდეს associated value Celsius-ის სახით. დაწერეთ function რომელიც მიიღებს ამ enum-ს, და მოგვცემს რეკომენდაციას რა უნდა ჩავიცვათ შესაბამისი ამინდის მიხედვით.

enum Weather {
    case Sunny(Double)
    case Cloudy(Double)
    case Rainy(Double)
    case Snowy(Double)
}

func recomendation(weather: Weather) {
    switch weather {
    case.Cloudy(let tempperature):
        tempperature >= 10.0
        print("მოსალოდნელია ღრუბელი,სახლიდან გასვლისას წაიღეთ მოსაცმელი")
    case.Rainy(let temperature):
        temperature >= 5
        print("მოსალოდნელია წვიმა, სახლიდან გასვლილას წაიღეთ ქოლგა")
    case.Snowy(let temperature):
        temperature >= 0
        print("მოსალოდნელია თოვლი, ჩაიცვით თბილად")
    case.Sunny(let temperature):
        temperature >= 20
        print("მოსალოდნელია მზე, ჩაიცვით გრილად :დ")
    }
}
recomendation(weather: .Cloudy(33))





//3. შექმენით struct-ი Book, with properties როგორიცაა: title, author, publicationYear. ამის შემდეგ შექმენით array-ი Book-ის ტიპის, შექმენით რამოდენიმე Book-ის ობიექტი, და შეავსეთ array ამ წიგნებით. დაწერეთ function რომელიც მიიღებს ამ წიგნების array-ს და მიიღებს წელს. function-მა უნდა დაგვიბრუნოს ყველა წიგნი რომელიც გამოშვებულია ამ წლის შემდეგ. დავ-print-ოთ ეს წიგნები.

struct Book {
    var title = ""
    var author = ""
    var publicationYear = 0
}
var booksArray: [Book] = []

let book1: Book = Book(title: "Jane Eyre", author: "Charlotte Bronte", publicationYear: 1847)
let book2: Book = Book(title: "Harry Potter", author: "Joanne Rowling", publicationYear: 1997)
let book3: Book = Book(title: "Crime and Punishment", author: "Fyodor Dostoevsky", publicationYear: 1867)

booksArray.append(book1)
booksArray.append(book2)
booksArray.append(book3)


func booksReleasedAfter(year: Int, from books: [Book]) -> [Book] {
    let filteredBooks = books.filter { $0.publicationYear > year }
    return filteredBooks
}

let filterAfterthisYear = 1900
let filteredBooks = booksReleasedAfter(year: filterAfterthisYear, from: booksArray)


for book in filteredBooks {
    print(book.title,book.author, book.publicationYear)
}

//4. 1.შექმენით struct BankAccount, with properties როგორიცაა: holderName, accountNumber, balance.
//2)ამ ობიექტში დაამატეთ methods, დეპოზიტისა და გატანის (withdraw), დაწერეთ შესაბამისი ლოგიკა და ეცადეთ გაითვალისწინოთ სხვადასხვა ეჯ-ქეისები (edge case). მაგ. თანხის გატანისას თუ თანხა იმაზე ნაკლებია ვიდრე გვაქვს, თანხას ვერ გავიტანთ და ასე შემდეგ.
//3)print-ის მეშვეობით გამოვიტანოთ შესაბამისი შეცდომები .
//4)ამის შემდეგ შექმენით BankAccount ობიექტი და გააკეთეთ ტრანზაქციების იმიტაცია თქვენს მიერ დაწერილი მეთოდებით.

struct BankAccount {
    var holderName: String
    var accountNumber: Int
    var balance: Int
    
    mutating func deposit(amount: Int) {
        self.balance += amount
    }
    
    mutating func withdraw(amount: Int) {
        if amount <= self.balance {
            self.balance -= amount
            print("Withdrawn \(amount) from the account.")
        } else {
            print("Insufficient balance. Cannot withdraw \(amount).")
        }
    }
}

var person1 = BankAccount(holderName: "mariami", accountNumber: 1, balance: 2000)
var person2 = BankAccount(holderName: "rezo", accountNumber: 2, balance: 3000)
var person3 = BankAccount(holderName: "tamuna", accountNumber: 3, balance: 4000)

person1.withdraw(amount: 1000)
print("Remaining balance for \(person1.holderName): \(person1.balance)")

person2.withdraw(amount: 4000)
print("Remaining balance for \(person2.holderName): \(person2.balance)")

person1.deposit(amount: 500)
print("deposit \(person1.holderName): \(person1.balance)")



//5. შექმენით enum-ი Genre მუსიკის ჟანრის ქეისებით. ამის შემდეგ შექმენით struct Song, with properties: title, artist, duration, genre, description (computied propertie უნდა იყოს description) და publisher (lazy propertie-ად შექმენით publisher). შემდეგ შექმენით თქვენი playlist array რომელსაც Song-ებით შეავსებთ (ზოგ song-ს ჰქონდეს publisher, ზოგს არა). შექმენით function რომელსაც გადააწვდით თქვენს playlist-ს და ჟანრს, function-ს დააბრუნებინეთ მხოლოდ იმ Song-ების array, რომელიც ამ ჟანრის იქნება და შემდეგ დაა-print-ინეთ ეს Song-ები.

enum Genre {
    case hipHop
    case jazz
    case pop
    case classical
}

struct Song {
    var title: String
    var artist: String
    var duration: Double
    var genre: Genre
    var description: String {
        return title; artist; duration; genre
    }
    var publisher: String? {
        return ""
    }
}

let song1 = Song(title: "grenade", artist: "bruno mars", duration: 4.20, genre: .jazz)
let song2 = Song(title: "treasure", artist: "bruno mars", duration: 3.20, genre: .jazz)
let song3 = Song(title: "believer", artist: "imaginedragons", duration: 3.40, genre: .pop)
let song4 = Song(title: "Swan Lake", artist: "Tchaikovsky", duration: 6.30, genre: .classical)

var playlist = [song1, song2, song3, song4]


func filterSongsByGenre(playlist: [Song], genre: Genre) -> [Song] {
    let filteredSongs = playlist.filter { $0.genre == genre }
    return filteredSongs
}

let genreToFilter = Genre.jazz
let jazzSongs = filterSongsByGenre(playlist: playlist, genre: genreToFilter)

print("Songs in the \(genreToFilter) genre:")
for song in jazzSongs {
    print(song.description)
}

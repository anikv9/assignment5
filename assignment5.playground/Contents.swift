import UIKit

var greeting = "Hello, playground"

//1
enum DayOfWeek {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

//let weekDay = [DayOfWeek.monday, DayOfWeek.tuesday, DayOfWeek.wednesday, DayOfWeek.thursday, DayOfWeek.friday]
//let weekEnd = [DayOfWeek.saturday, DayOfWeek.sunday]


func checkTheDay (DayOfWeek: DayOfWeek) {
    switch DayOfWeek {
    case .monday, .tuesday, .wednesday, .thursday, .friday:
        print("Thats weekday, unfortunetely")
    case .saturday, .sunday:
        print("Thats weekend, hooray!")
    }
}

var checkingDay = DayOfWeek.saturday
checkTheDay(DayOfWeek: checkingDay)

//2


enum Weather {
    case sunny (celsius: Double)
    case cloudy (celsius: Double)
    case rainy (celsius: Double)
    case snowy (celsius: Double)
}


func whatToWear (on weather: Weather) {
    switch weather {
    case .sunny (let celsius):
        if celsius > 30 {
            print("Its hot outside, wear shorts")
        } else {
            print("Its warm outside, go without jacket")
        }
    case .cloudy (let celsius):
        if celsius > 20 {
            print("Its warm, but still take light jacket with you")
        } else {
            print("Its cool, wear trousers and sweater")
        }
            
    case .rainy(celsius: let celsius):
        if celsius > 15 {
            print("Its rainy and cold, wear jacket and take umbrella with you")
        } else {
            print ("Its super cool outside, wear boots, coat and dont forget your umbrella")
        }
    case .snowy(celsius: let celsius):
        if celsius > 0 {
            print("Its snowing, wear puffer jacket and some boots")
        } else {
            print("Its freezing outside, wear warm puffer jacket, boots, hat and gloves")
        }
            
    }
}

let todaysWeather = Weather.rainy(celsius: 12.6)
print(whatToWear(on: todaysWeather))

//3

struct Book {
    var title: String
    var author: String
    var publicationYear: Int
}

// Create an array of Book objects
var library: [Book] = [
    Book(title: "Book 1", author: "Author 1", publicationYear: 2001),
    Book(title: "Book 2", author: "Author 2", publicationYear: 2002),
    Book(title: "Book 3", author: "Author 3", publicationYear: 2003),
    Book(title: "Book 4", author: "Author 4", publicationYear: 2004),
]

func filterBooks(Year year: Int, Library library: [Book]) -> (Int, [Book]) {
    let filteredBooks = library.filter { $0.publicationYear > year }
    return (year, filteredBooks)
}

let yearToFilter = 2002
let booksAfter2002 = filterBooks(Year: yearToFilter, Library: library)

for book in booksAfter2002 {
    print("Title: \(book.title), Author: \(book.author), Year: \(book.publicationYear)")
}


//5
enum MusicGenre {
    case pop
    case hiphop
    case rock
    case soul
    case jazz
    case blues
    case funk
}

struct Song {
    var title : String
    var artist : String
    var duration : Int //will store them in seconds
    var genre : String
    var description : String {
        return "\(title) is by \(artist), Genre: \(genre)"
    }
    lazy var publisher: String = {
        return "Some publisher name"
} ()
    
init(title: String, artist: String, duration: Int, genre: String, description: String) {
        self.title = title
        self.artist = artist
        self.duration = duration
        self.genre = genre
    }
}


var myPlaylist: [(Song)] = [
    (Song(title: "Song 1", artist: "Artist 1", duration: 1, genre: "Genre 1", description: "Something1", publisher: nil)),
    (Song(title: "Song 2", artist: "Artist 2", duration: 2, genre: "Genre 2", description: "Something2", publisher: nil)),
    (Song(title: "Song 3", artist: "Artist 3", duration: 3, genre: "Genre 2", description: "Something3", publisher: "Some publisher"))
]

for element in myPlaylist {
    print(element)
}

func filterSongs (playlist: [Song], genre: String) -> [Song] {
    return playlist.filter { $0.genre == genre }
}

let filteredSongs = filterSongs(playlist: myPlaylist, genre: "Genre 2")
for song in filteredSongs {
    print(song.description)
}

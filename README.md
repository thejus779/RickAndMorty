# RickAndMorty

Welcome to RickAndMorty app, a basic app which has 3 tabs, 1st displays the charachters and their details, 2nd displays the locations and 3rd all the episodes aired till now.

## Pre-requirements

1. Minimun deployment target iOS 16

## Libraries used

### Swift package manger
1. SDWebImage -> https://github.com/SDWebImage/SDWebImage -> Only used for managing cached images, as the mocked image urls are loaded from network.
2. Rswift -> https://github.com/mac-cain13/R.swift -> User for autogeneration of strings, assets, fonts, storyboard identifiers etc.



## Architecure

1. RickAndMorty uses MVVM + coordinator architecure where all data is handled at Model level, View models respective to each view user the model and implements all business logic, and Controllers as Views.
2. All routings and flows are handled by respective Coordinators.
3. Uses pagination on all RickAndMortyApi's used'.


## Known Issues to improve in V2

1. Maybe to introduce a cache for the network calls if any.
2. Better UI with some good assests and images.


## Usage

###  RMService -> Protocol for service calls (RMNetworkService and RMMockService implements this)

    ```func getAllEpisodes(pageNo: Int, completion: @escaping ResultCallback<RMData<RMEpisode>>)```
    Makes an async call to fetch all episodes results with pagination support, can throw erros of type RMError.
    
    ```func getAllLocations(pageNo: Int, completion: @escaping ResultCallback<RMData<RMLocation>>)```
    Makes an async call to fetch all locations results with pagination support, can throw erros of type RMError.
    
    ```func getAllCharachters(pageNo: Int, completion: @escaping ResultCallback<RMData<RMCharachter>>)```
    Makes an async call to fetch all charachter results with pagination support, can throw erros of type RMError.
    
    
## Protocols
    
### Spawnable
    Helps in easy instantiating View controllers from storyboard using `storyboardName` and `storyboardIdentifier`
   
    
## Coordinators

### AppCoordinator
    Handles all routing/navigations at AppDelegate level
### RMCharachtersCoordinator
    Handles all routing/navigations and flow at Character tab
### RMEpisodesCoordinator
    Handles all routing/navigations and flow at Episodes tab
### RMLocationsCoordinator
    Handles all routing/navigations and flow at Locations tab

    

## Tests


### Unit Tests & integration tests
Performs unit tests on small modules + complete flow


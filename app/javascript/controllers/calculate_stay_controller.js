import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="calculate-stay"
export default class extends Controller {
  connect() {
    // console.log("calculate-stay-connected")
  }
  calculate(event) {
    const dates=event.target.value.split(" ")
    // console.log(dates[0].length)
    // console.log(dates.split(" "))
    if (dates.length === 3)
 {   const tempSatrtDate=dates[0].split('-')
 console.log(tempSatrtDate)
     const startDate = new Date (tempSatrtDate[1],tempSatrtDate[0],tempSatrtDate[2])
     const tempEndDate=dates[2].split('-')
     const endDate = new Date (tempEndDate[0],tempEndDate[1],tempEndDate[2])
    // console.log(dates.split(" "))
    console.log(startDate)
    console.log(endDate)
  }
}
}

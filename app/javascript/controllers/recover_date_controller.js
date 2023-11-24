import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static values = {
  //   price: Number
  // }

  // static targets = ["totalStay","daysDiff","totalAmount","dates","option"]

  connect() {
  }

  date() {
    const dates=this.datesTarget.value.split(" ")
    const tempStartDate=dates[0].split('-')
    const startDate = new Date (`20${tempStartDate[2]}`,Number(tempStartDate[1])-1,tempStartDate[0])

    console.log(startDate)

    const tempEndDate=dates[2].split('-')
    const endDate = new Date (`20${tempEndDate[2]}`,Number(tempEndDate[1])-1,tempEndDate[0])

    console.log(endDate)

    this.startDateTarget.innerText=`Date d'arrivée ${startDate} `
    this.endDateTarget.innerText=`Date de départ ${endDate} `
  }
}

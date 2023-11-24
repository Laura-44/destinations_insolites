import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    price: Number
  }

  static targets = ["totalStay","daysDiff","totalAmount","dates","option"]

  connect() {
  }

  calculate(event) {
  const dates=this.datesTarget.value.split(" ")


  if (dates.length === 3){
      const tempStartDate=dates[0].split('-')
      const startDate = new Date (`20${tempStartDate[2]}`,Number(tempStartDate[1])-1,tempStartDate[0])

      console.log(startDate)

      const tempEndDate=dates[2].split('-')
      const endDate = new Date (`20${tempEndDate[2]}`,Number(tempEndDate[1])-1,tempEndDate[0])

      console.log(endDate)

      const timeDiff = Math.abs(endDate.getTime() - startDate.getTime());
      const daysDiff = Math.ceil(timeDiff / (1000 * 3600 * 24));

      console.log(daysDiff)

      this.daysDiffTarget.innerText=`Séjour de ${daysDiff} nuitées`
      let calculated = (daysDiff*this.priceValue)
      this.optionTargets.forEach( (option) => {
        if (option.checked) {

          console.log(option.checked)

          calculated = calculated + (Number(option.value)*daysDiff)
        }
      })
      this.totalStayTarget.innerText=`Coût Total du séjour ${calculated} €`
      console.log(calculated)
    }
  }
}

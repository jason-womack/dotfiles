package controllers

import play.api.mvc.{Controller, Action}
import play.api.libs.json.{JsArray, Json}
import com.typesafe.config.ConfigFactory
import play.api.libs.ws.{Response, WS}

object Cities extends Controller {
  val geocodeUrl = ConfigFactory.load("application").getString("geocoder.url")

  /**
   * A sample function which does PLENTY the wrong way.
   * It's here as an example of both what NOT to do, but also how to find locations and one way to produce JSON
   * @param apiKey the authorization key for this service (you should have been provided one)
   * @param city the name of a city
   * @return respond w/ JSON showing the cities' formatted address, latitude, and longitude
   */
  def findLocation(apiKey: String, city: String) = Action { request =>
    val request = makeGeocodeRequest(apiKey, city)
    while(request.isCompleted == false) {
      Thread.sleep(10)
    }
    val response = request.value.get.get
    val coordinate = getCoordinatesFromResponse(response)
    Ok(Json.toJson(Map("name" -> coordinate.formattedAddress, "latitude" -> String.valueOf(coordinate.latitude), "longitude" -> String.valueOf(coordinate.longitude))))
  }

  /*
   * @TODO: Fill this in
   */
  def findFurthest(apiKey: String) = Action(parse.tolerantJson) { request =>
    val names = (request.body \ "cities").as[JsArray].value.map(_.as[String])
    NotImplemented
  }

  def makeGeocodeRequest(apiKey: String, cityName: String) ={
    WS.url(geocodeUrl).withQueryString(("q", cityName), ("key", apiKey)).get()
  }

  def getCoordinatesFromResponse(response: Response) = {
    val topHit = (response.json \ "candidates")(0)
    Coordinate((topHit \ "formattedAddress").as[String], (topHit \ "geometry" \ "lat").as[Double], (topHit \ "geometry" \ "lng").as[Double])
  }
}
case class Coordinate(formattedAddress: String, latitude: Double, longitude: Double)
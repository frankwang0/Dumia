namespace Dumia.Http

open Owin
open Microsoft.Owin
open Newtonsoft.Json
open System
open System.Net.Http
open System.Web
open System.Web.Http
open System.Web.Http.Owin
open System.Web.Http.Dispatcher
open Domain.Http.Infrastructure
open System.Net.Http.Formatting
open System.Web.Http.Cors

type Settings = FSharp.Configuration.AppSettings<"web.config">

[<Sealed>]
type Startup() = 

    let registerWebApi (app : IAppBuilder) = 

        let config = new HttpConfiguration()
        // Configure routing
        config.MapHttpAttributeRoutes()
        
        // Remove XML Formatter and Fix Json Camel Case
        config.Formatters.Remove(config.Formatters.XmlFormatter) |> ignore
        config.Formatters.JsonFormatter.SerializerSettings.ContractResolver <- Serialization.DefaultContractResolver()

        // Enable Cross Origin Resource Sharing
        config.EnableCors(EnableCorsAttribute("*","*","*"))

        // Replace the Default Controller Factory with Composition Root
        config.Services.Replace(typeof<IHttpControllerActivator>, CompositionRoot())

        // Finally Use Web API
        app.UseWebApi(config)
    
    let customPages (app : IAppBuilder) = 
        app.UseWelcomePage("/").UseErrorPage()

    let migrateDatabase (app:IAppBuilder)=
        FluentRunner.MigrateToLatest(Settings.ConnectionStrings.Dumia)
        app

    member this.Configuration(app : IAppBuilder) = 
        registerWebApi (app)
        |> migrateDatabase
        |> customPages
        |> ignore
